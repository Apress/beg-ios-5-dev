//
//  BIDGLFunView.h
//  GLFun
//
//  Created by Dave Mark on 10/28/11.
//  Copyright (c) 2011 Dave Mark. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "BIDConstants.h"
#import "OpenGLES2DView.h"

@class Texture2D;

@interface BIDGLFunView : OpenGLES2DView    
@property CGPoint firstTouch;
@property CGPoint lastTouch;
@property (nonatomic, strong) UIColor *currentColor;
@property BOOL useRandomColor;
@property ShapeType shapeType;
@property (nonatomic, strong) Texture2D *sprite;
@end
