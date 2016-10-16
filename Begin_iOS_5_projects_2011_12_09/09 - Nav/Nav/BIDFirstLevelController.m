//
//  BIDFirstLevelController.m
//  Nav
//
//  Created by Jack Nutting on 9/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "BIDFirstLevelController.h"
#import "BIDSecondLevelViewController.h"

#import "BIDDisclosureButtonController.h"
#import "BIDCheckListController.h"
#import "BIDRowControlsController.h"
#import "BIDMoveMeController.h"
#import "BIDDeleteMeController.h"
#import "BIDPresidentsViewController.h"

@implementation BIDFirstLevelController

@synthesize controllers;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"First Level";
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    // Disclosure Button
    BIDDisclosureButtonController *disclosureButtonController =
    [[BIDDisclosureButtonController alloc]
     initWithStyle:UITableViewStylePlain];
    disclosureButtonController.title = @"Disclosure Buttons";
    disclosureButtonController.rowImage = [UIImage
                                           imageNamed:@"disclosureButtonControllerIcon.png"];
    [array addObject:disclosureButtonController];
    
    // Checklist
    BIDCheckListController *checkListController = [[BIDCheckListController alloc]
                                                   initWithStyle:UITableViewStylePlain];
    checkListController.title = @"Check One";
    checkListController.rowImage = [UIImage imageNamed:
                                    @"checkmarkControllerIcon.png"];
    [array addObject:checkListController];
    
    // Table Row Controls
    BIDRowControlsController *rowControlsController =
    [[BIDRowControlsController alloc]
     initWithStyle:UITableViewStylePlain];
    rowControlsController.title = @"Row Controls";
    rowControlsController.rowImage = [UIImage imageNamed:
                                      @"rowControlsIcon.png"];
    [array addObject:rowControlsController];
    
    // Move Me
    BIDMoveMeController *moveMeController = [[BIDMoveMeController alloc]
                                             initWithStyle:UITableViewStylePlain];
    moveMeController.title = @"Move Me";
    moveMeController.rowImage = [UIImage imageNamed:@"moveMeIcon.png"];
    [array addObject:moveMeController];

    // Delete Me
    BIDDeleteMeController *deleteMeController = [[BIDDeleteMeController alloc]
                                                 initWithStyle:UITableViewStylePlain];
    deleteMeController.title = @"Delete Me";
    deleteMeController.rowImage = [UIImage imageNamed:@"deleteMeIcon.png"];
    [array addObject:deleteMeController];
    
    // BIDPresident View/Edit
    BIDPresidentsViewController *presidentsViewController =
    [[BIDPresidentsViewController alloc]
     initWithStyle:UITableViewStylePlain];
    presidentsViewController.title = @"Detail Edit";
    presidentsViewController.rowImage = [UIImage imageNamed:
                                         @"detailEditIcon.png"];
    [array addObject:presidentsViewController];

    self.controllers = array;
}

- (void)viewDidUnload {
    [super viewDidUnload];
    self.controllers = nil;
}

#pragma mark -
#pragma mark Table Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [self.controllers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *FirstLevelCell = @"FirstLevelCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             FirstLevelCell];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier: FirstLevelCell];
    }
    // Configure the cell
    NSUInteger row = [indexPath row];
    BIDSecondLevelViewController *controller =
    [controllers objectAtIndex:row];
    cell.textLabel.text = controller.title;
    cell.imageView.image = controller.rowImage;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark -
#pragma mark Table View Delegate Methods
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = [indexPath row];
    BIDSecondLevelViewController *nextController = [self.controllers
                                                    objectAtIndex:row];
    [self.navigationController pushViewController:nextController
                                         animated:YES];
}

@end
