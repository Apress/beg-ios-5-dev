//
//  BIDViewController.h
//  Button Fun
//
//  Created by Dave Mark on 8/28/11.
//  Copyright (c) 2011 Dave Mark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *statusText;
- (IBAction)buttonPressed:(id)sender;

@end
