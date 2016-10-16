//
//  BIDFlipsideViewController.h
//  AppSettings
//
//  Created by Dave Mark on 9/16/11.
//  Copyright (c) 2011 Dave Mark. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BIDFlipsideViewController;

@protocol BIDFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(BIDFlipsideViewController *)controller;
@end

@interface BIDFlipsideViewController : UIViewController

@property (weak, nonatomic) IBOutlet id <BIDFlipsideViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UISwitch *engineSwitch;
@property (strong, nonatomic) IBOutlet UISlider *warpFactorSlider;

- (void)refreshFields;
- (IBAction)engineSwitchTapped;
- (IBAction)warpSliderTouched;
- (IBAction)done:(id)sender;

@end
