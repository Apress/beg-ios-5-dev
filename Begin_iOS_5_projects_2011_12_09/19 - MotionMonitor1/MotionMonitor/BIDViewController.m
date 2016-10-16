//
//  BIDViewController.m
//  MotionMonitor
//
//  Created by Dave Mark on 10/2/11.
//  Copyright (c) 2011 Dave Mark. All rights reserved.
//

#import "BIDViewController.h"

@implementation BIDViewController
@synthesize motionManager;
@synthesize accelerometerLabel;
@synthesize gyroscopeLabel;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.motionManager = [[CMMotionManager alloc] init];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    if (motionManager.accelerometerAvailable) {
        motionManager.accelerometerUpdateInterval = 1.0/10.0;
        [motionManager startAccelerometerUpdatesToQueue:queue withHandler:
         ^(CMAccelerometerData *accelerometerData, NSError *error){
             NSString *labelText;
             if (error) {
                 [motionManager stopAccelerometerUpdates];
                 labelText = [NSString stringWithFormat:
                              @"Accelerometer encountered error: %@", error];
             } else {
                 labelText = [NSString stringWithFormat:
                              @"Accelerometer\n-----------\nx: %+.2f\ny: %+.2f\nz: %+.2f", 
                              accelerometerData.acceleration.x, 
                              accelerometerData.acceleration.y, 
                              accelerometerData.acceleration.z];
             }
             [accelerometerLabel performSelectorOnMainThread:@selector(setText:) 
                                                  withObject:labelText 
                                               waitUntilDone:NO];
         }];
    } else {
        accelerometerLabel.text = @"This device has no accelerometer.";
    }
    if (motionManager.gyroAvailable) {
        motionManager.gyroUpdateInterval = 1.0/10.0;
        [motionManager startGyroUpdatesToQueue:queue withHandler:
         ^(CMGyroData *gyroData, NSError *error) {
             NSString *labelText;
             if (error) {
                 [motionManager stopGyroUpdates];
                 labelText = [NSString stringWithFormat:
                              @"Gyroscope encountered error: %@", error];
             } else {
                 labelText = [NSString stringWithFormat:
                              @"Gyroscope\n--------\nx: %+.2f\ny: %+.2f\nz: %+.2f", 
                              gyroData.rotationRate.x, 
                              gyroData.rotationRate.y, 
                              gyroData.rotationRate.z];
             }
             [gyroscopeLabel performSelectorOnMainThread:@selector(setText:) 
                                              withObject:labelText 
                                           waitUntilDone:NO];
         }];
    } else {
        gyroscopeLabel.text = @"This device has no gyroscope";
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.motionManager = nil;
    self.accelerometerLabel = nil;
    self.gyroscopeLabel = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
