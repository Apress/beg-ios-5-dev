//
//  BIDViewController.h
//  Ball
//
//  Created by Dave Mark on 10/2/11.
//  Copyright (c) 2011 Dave Mark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface BIDViewController : UIViewController

@property (strong, nonatomic) CMMotionManager *motionManager;
@end
