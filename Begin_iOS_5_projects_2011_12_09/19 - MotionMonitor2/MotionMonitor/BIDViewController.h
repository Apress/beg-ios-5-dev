//
//  BIDViewController.h
//  MotionMonitor
//
//  Created by Dave Mark on 10/2/11.
//  Copyright (c) 2011 Dave Mark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface BIDViewController : UIViewController

@property (strong, nonatomic) CMMotionManager *motionManager;
@property (strong, nonatomic) IBOutlet UILabel *accelerometerLabel;
@property (strong, nonatomic) IBOutlet UILabel *gyroscopeLabel;
@property (retain) NSTimer *updateTimer;

@end
