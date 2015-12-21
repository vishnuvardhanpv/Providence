//
//  Constants.m
//  Inbox
//
//  Created by Vishnu Vardhan PV on 15/12/15.
//  Copyright © 2015 Vishnu Vardhan PV. All rights reserved.
//

#import "Constants.h"

@implementation Constants

#pragma mark - URLs

NSString * const BASE_URL = @"http://68.169.44.163/api/";
NSString * const GET_FRIENDS_URL = @"friends/id/";
NSString * const GET_GROUPS_URL = @"groups/userId/";
NSString * const GET_USER_PROFILE_URL = @"users/id/";

NSString * const APP_BG_COLOR_KEY = @"AppBgColorKey";

# pragma mark - Storyboard Identifiers

NSString * const TopBarView = @"TopBarViewController";
NSString * const BottomBarView = @"BottomBarViewController";
NSString * const FriendView = @"FriendViewController";
NSString * const GroupView = @"GroupViewController";
NSString * const MeView = @"MeViewController";
NSString * const ContactView = @"ContactViewController";

@end
