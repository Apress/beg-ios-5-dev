//
//  BIDViewController.m
//  ShakeAndBreak
//
//  Created by Dave Mark on 10/2/11.
//  Copyright (c) 2011 Dave Mark. All rights reserved.
//

#import "BIDViewController.h"

@implementation BIDViewController
@synthesize imageView;
@synthesize motionManager;
@synthesize brokenScreenShowing;
@synthesize soundID;
@synthesize fixed;
@synthesize broken;

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
    NSString *path = [[NSBundle mainBundle] pathForResource:@"glass"
                                                     ofType:@"wav"];
    NSURL *url = [NSURL fileURLWithPath:path];
    AudioServicesCreateSystemSoundID((CFURLRef)objc_unretainedPointer(url),
                                     &soundID);
    self.fixed = [UIImage imageNamed:@"home.png"];
    self.broken = [UIImage imageNamed:@"homebroken.png"];
    
    imageView.image = fixed;
    
    self.motionManager = [[CMMotionManager alloc] init];
    motionManager.accelerometerUpdateInterval = kUpdateInterval;
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [motionManager startAccelerometerUpdatesToQueue:queue
                                        withHandler:
     ^(CMAccelerometerData *accelerometerData, NSError *error){
         if (error) {
             [motionManager stopAccelerometerUpdates];
         } else {
             if (!brokenScreenShowing) {
                 CMAcceleration acceleration = accelerometerData.acceleration;
                 if (acceleration.x > kAccelerationThreshold
                     || acceleration.y > kAccelerationThreshold
                     || acceleration.z > kAccelerationThreshold) {
                     [imageView performSelectorOnMainThread:@selector(setImage:)
                                                 withObject:broken
                                              waitUntilDone:NO];
                     AudioServicesPlaySystemSound(soundID);
                     brokenScreenShowing = YES;
                 }
             }
         }
     }];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.imageView = nil;
    self.motionManager = nil;
    self.fixed = nil;
    self.broken = nil;
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

#pragma mark -
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    imageView.image = fixed;
    brokenScreenShowing = NO;
}

@end
