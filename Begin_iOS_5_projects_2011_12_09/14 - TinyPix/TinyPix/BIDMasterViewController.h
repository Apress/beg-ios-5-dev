//
//  BIDMasterViewController.h
//  TinyPix
//
//  Created by Dave Mark on 11/13/11.
//  Copyright (c) 2011 Dave Mark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDMasterViewController : UITableViewController <UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *colorControl;
- (IBAction)chooseColor:(id)sender;

@end
