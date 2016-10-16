//
//  BIDDeleteMeController.h
//  Nav
//
//  Created by Jack Nutting on 9/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "BIDSecondLevelViewController.h"

@interface BIDDeleteMeController : BIDSecondLevelViewController

@property (strong, nonatomic) NSMutableArray *list;
- (IBAction)toggleEdit:(id)sender;
@end
