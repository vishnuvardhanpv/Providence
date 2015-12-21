//
//  FriendViewController.m
//  Inbox
//
//  Created by Vishnu Vardhan PV on 16/12/15.
//  Copyright © 2015 Vishnu Vardhan PV. All rights reserved.
//

#import "FriendViewController.h"
#import "UserAPIManager.h"
#import "UIImageView+WebCache.h"
#import "Utilities.h"

@implementation FriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self callAPIToGetTheUserProfile];
}

- (void)populateView {
    [Utilities makeCircularImageView:self.profileImageView];
    [self.profileImageView sd_setImageWithURL:[NSURL URLWithString:self.friendObj.profilePic]];
    self.usernameLabel.text = [NSString stringWithFormat:@"%@ %@", self.friendObj.firstName, self.friendObj.lastName];
}

#pragma mark - API

- (void)callAPIToGetTheUserProfile {
    [UserAPIManager getTheProfileForTheUserID:self.friendObj.friendId
                             withSuccessBlock:^(id object) {
                                 NSLog(@"%@", object);
                                 self.friendObj = [MTLJSONAdapter modelOfClass:[Friend class] fromJSONDictionary:[object valueForKey:@"data"] error:nil];
                                 [self populateView];
                             } andFail:^(NSError *errorMessage) {
                                 NSLog(@"%@", errorMessage);
                             }];
}

@end
