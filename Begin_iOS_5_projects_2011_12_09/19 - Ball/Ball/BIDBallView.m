//
//  BIDBallView.m
//  Ball
//
//  Created by Dave Mark on 10/2/11.
//  Copyright (c) 2011 Dave Mark. All rights reserved.
//

#import "BIDBallView.h"

@implementation BIDBallView
@synthesize image;
@synthesize currentPoint;
@synthesize previousPoint;
@synthesize acceleration;
@synthesize ballXVelocity;
@synthesize ballYVelocity;

- (id)initWithCoder:(NSCoder *)coder {
    
    if (self = [super initWithCoder:coder]) {
        self.image = [UIImage imageNamed:@"ball.png"];
        self.currentPoint = CGPointMake((self.bounds.size.width / 2.0f) +
                                        (image.size.width / 2.0f),
                                        (self.bounds.size.height / 2.0f) + (image.size.height / 2.0f));
        
        ballXVelocity = 0.0f;
        ballYVelocity = 0.0f;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
     [image drawAtPoint:currentPoint];
}

#pragma mark -
- (CGPoint)currentPoint {
    return currentPoint;
}

- (void)setCurrentPoint:(CGPoint)newPoint {
    previousPoint = currentPoint;
    currentPoint = newPoint;
    
    if (currentPoint.x < 0) {
        currentPoint.x = 0;
        ballXVelocity = 0;
    }
    if (currentPoint.y < 0){
        currentPoint.y = 0;
        ballYVelocity = 0;
    }
    if (currentPoint.x > self.bounds.size.width - image.size.width) {
        currentPoint.x = self.bounds.size.width - image.size.width;
        ballXVelocity = 0;
    }
    if (currentPoint.y > self.bounds.size.height - image.size.height) {
        currentPoint.y = self.bounds.size.height - image.size.height;
        ballYVelocity = 0;
    }
    
    CGRect currentImageRect = CGRectMake(currentPoint.x, currentPoint.y,
                                         currentPoint.x + image.size.width,
                                         currentPoint.y + image.size.height);
    CGRect previousImageRect = CGRectMake(previousPoint.x, previousPoint.y,
                                          previousPoint.x + image.size.width,
                                          currentPoint.y + image.size.width);
    [self setNeedsDisplayInRect:CGRectUnion(currentImageRect,
                                            previousImageRect)];
}

- (void)update {
    static NSDate *lastUpdateTime;
    
    if (lastUpdateTime != nil) {
        NSTimeInterval secondsSinceLastDraw =
        -([lastUpdateTime timeIntervalSinceNow]);
        
        ballYVelocity = ballYVelocity + -(acceleration.y *
                                          secondsSinceLastDraw);
        ballXVelocity = ballXVelocity + acceleration.x *
        secondsSinceLastDraw;
        
        CGFloat xAcceleration = secondsSinceLastDraw * ballXVelocity * 500;
        CGFloat yAcceleration = secondsSinceLastDraw * ballYVelocity * 500;
        
        self.currentPoint = CGPointMake(self.currentPoint.x +
                                        xAcceleration, self.currentPoint.y + yAcceleration);
    }
    // Update last time with current time
    lastUpdateTime = [[NSDate alloc] init];
}

@end
