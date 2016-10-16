//
//  BIDDetailViewController.h
//  TinyPix
//
//  Created by Dave Mark on 11/13/11.
//  Copyright (c) 2011 Dave Mark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BIDTinyPixView.h"

@interface BIDDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet BIDTinyPixView *pixView;

@end
