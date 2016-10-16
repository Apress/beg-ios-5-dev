//
//  BIDCheckListController.h
//  Nav
//
//  Created by Jack Nutting on 9/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "BIDSecondLevelViewController.h"

@interface BIDCheckListController : BIDSecondLevelViewController

@property (strong, nonatomic) NSArray *list;
@property (strong, nonatomic) NSIndexPath *lastIndexPath;

@end
