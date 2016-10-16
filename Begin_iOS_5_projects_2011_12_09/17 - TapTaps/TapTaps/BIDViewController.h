//
//  BIDViewController.h
//  TapTaps
//
//  Created by Dave Mark on 10/1/11.
//  Copyright (c) 2011 Dave Mark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *singleLabel;
@property (strong, nonatomic) IBOutlet UILabel *doubleLabel;
@property (strong, nonatomic) IBOutlet UILabel *tripleLabel;
@property (strong, nonatomic) IBOutlet UILabel *quadrupleLabel;
- (void)tap1;
- (void)tap2;
- (void)tap3;
- (void)tap4;
- (void)eraseMe:(UILabel *)label;
@end
