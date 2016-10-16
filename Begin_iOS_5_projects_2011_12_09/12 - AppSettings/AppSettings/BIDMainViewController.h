//
//  BIDMainViewController.h
//  AppSettings
//
//  Created by Dave Mark on 9/16/11.
//  Copyright (c) 2011 Dave Mark. All rights reserved.
//

#import "BIDFlipsideViewController.h"
#define kUsernameKey        @"username"
#define kPasswordKey        @"password"
#define kProtocolKey        @"protocol"
#define kWarpDriveKey       @"warp"
#define kWarpFactorKey      @"warpFactor"
#define kFavoriteTeaKey     @"favoriteTea"
#define kFavoriteCandyKey   @"favoriteCandy"
#define kFavoriteGameKey    @"favoriteGame"
#define kFavoriteExcuseKey  @"favoriteExcuse"
#define kFavoriteSinKey     @"favoriteSin"

@interface BIDMainViewController : UIViewController
<BIDFlipsideViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) IBOutlet UILabel *passwordLabel;
@property (strong, nonatomic) IBOutlet UILabel *protocolLabel;
@property (strong, nonatomic) IBOutlet UILabel *warpDriveLabel;
@property (strong, nonatomic) IBOutlet UILabel *warpFactorLabel;
@property (strong, nonatomic) IBOutlet UILabel *favoriteTeaLabel;
@property (strong, nonatomic) IBOutlet UILabel *favoriteCandyLabel;
@property (strong, nonatomic) IBOutlet UILabel *favoriteGameLabel;
@property (strong, nonatomic) IBOutlet UILabel *favoriteExcuseLabel;
@property (strong, nonatomic) IBOutlet UILabel *favoriteSinLabel;

- (void)refreshFields;
@end
