//
//  BIDViewController.h
//  Persistence
//
//  Created by Dave Mark on 9/21/11.
//  Copyright (c) 2011 Dave Mark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *field1;
@property (strong, nonatomic) IBOutlet UITextField *field2;
@property (strong, nonatomic) IBOutlet UITextField *field3;
@property (strong, nonatomic) IBOutlet UITextField *field4;
- (NSString *)dataFilePath;
- (void)applicationWillResignActive:(NSNotification *)notification;
@end
