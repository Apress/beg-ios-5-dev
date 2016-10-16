//
//  BIDViewController.h
//  ShakeAndBreak
//
//  Created by Jack Nutting on 10/2/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreMotion/CoreMotion.h>
#import <AudioToolbox/AudioToolbox.h>

#define kAccelerationThreshold       1.7
#define kUpdateInterval              (1.0f/10.0f)

@interface BIDViewController : UIViewController
<UIAccelerometerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (assign, nonatomic) SystemSoundID soundID;
@property (strong, nonatomic) UIImage *fixed;
@property (strong, nonatomic) UIImage *broken;
@end
