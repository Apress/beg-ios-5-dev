//
//  BIDMasterViewController.h
//  Presidents
//
//  Created by Dave Mark on 9/13/11.
//  Copyright (c) 2011 Dave Mark. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BIDDetailViewController;

@interface BIDMasterViewController : UITableViewController

@property (strong, nonatomic) BIDDetailViewController *detailViewController;
@property (strong, nonatomic) NSArray *presidents;
@end
