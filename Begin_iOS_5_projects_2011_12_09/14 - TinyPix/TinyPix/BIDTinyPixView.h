//
//  BIDTinyPixView.h
//  TinyPix
//
//  Created by Dave Mark on 11/14/11.
//  Copyright (c) 2011 Dave Mark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BIDTinyPixDocument.h"

@interface BIDTinyPixView : UIView

@property (strong, nonatomic) BIDTinyPixDocument *document;
@property (strong, nonatomic) UIColor *highlightColor;

@end
