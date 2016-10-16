//
//  BIDTinyPixView.m
//  TinyPix
//
//  Created by Dave Mark on 11/14/11.
//  Copyright (c) 2011 Dave Mark. All rights reserved.
//

#import "BIDTinyPixView.h"

typedef struct {
    NSUInteger row;
    NSUInteger column;
} GridIndex;

@interface BIDTinyPixView ()
@property (assign, nonatomic) CGSize blockSize;
@property (assign, nonatomic) CGSize gapSize;
@property (assign, nonatomic) GridIndex selectedBlockIndex;
- (void)initProperties;
- (void)drawBlockAtRow:(NSUInteger)row column:(NSUInteger)column;
- (GridIndex)touchedGridIndexFromTouches:(NSSet *)touches;
- (void)toggleSelectedBlock;
@end

@implementation BIDTinyPixView

@synthesize document;
@synthesize highlightColor;

@synthesize blockSize;
@synthesize gapSize;
@synthesize selectedBlockIndex;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initProperties];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initProperties];
    }
    return self;
}

- (void)initProperties {
    blockSize = CGSizeMake(34, 34);
    gapSize = CGSizeMake(5, 5);
    selectedBlockIndex.row = NSNotFound;
    selectedBlockIndex.column = NSNotFound;
    highlightColor = [UIColor blackColor];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    if (!document) return;
    
    for (NSUInteger row = 0; row < 8; row++) {
        for (NSUInteger column = 0; column < 8; column++) {
            [self drawBlockAtRow:row column:column];
        }
    }  
}

- (void)drawBlockAtRow:(NSUInteger)row column:(NSUInteger)column {
    CGFloat startX = (blockSize.width + gapSize.width) * (7 - column) + 1;
    CGFloat startY = (blockSize.height + gapSize.height) * row + 1;
    CGRect blockFrame = CGRectMake(startX, startY, blockSize.width, blockSize.height);
    UIColor *color = [document stateAtRow:row column:column] ? 
    self.highlightColor : [UIColor whiteColor];
    [color setFill];
    [[UIColor lightGrayColor] setStroke];
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:blockFrame];
    [path fill];
    [path stroke];
}

- (GridIndex)touchedGridIndexFromTouches:(NSSet *)touches {
    GridIndex result;
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    result.column = 8 - (location.x * 8.0 / self.bounds.size.width);
    result.row = location.y * 8.0 / self.bounds.size.height;
    return result;
}

- (void)toggleSelectedBlock {
    [document toggleStateAtRow:selectedBlockIndex.row column:selectedBlockIndex.column];
    [[document.undoManager prepareWithInvocationTarget:document]
        toggleStateAtRow:selectedBlockIndex.row column:selectedBlockIndex.column];
    [self setNeedsDisplay];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.selectedBlockIndex = [self touchedGridIndexFromTouches:touches];
    [self toggleSelectedBlock];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    GridIndex touched = [self touchedGridIndexFromTouches:touches];
    if (touched.row != selectedBlockIndex.row
        || touched.column != selectedBlockIndex.column) {
        selectedBlockIndex = touched;
        [self toggleSelectedBlock];
    }
}

@end
