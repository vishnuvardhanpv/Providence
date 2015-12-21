//
//  FriendsCollectionViewCell.m
//  Inbox
//
//  Created by Vishnu Vardhan PV on 20/12/15.
//  Copyright © 2015 Vishnu Vardhan PV. All rights reserved.
//

#import "FriendsCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import <QuartzCore/QuartzCore.h>

@implementation FriendsCollectionViewCell

- (void)populateCell:(Friend *)friendModel {
    [self makeCircularImageView];
    self.friendObject = friendModel;
    [self.friendImageView sd_setImageWithURL:[NSURL URLWithString:friendModel.profilePic]];
    self.friendNameLabel.text = friendModel.firstName;
}

- (void)makeCircularImageView {
    self.friendImageView.layer.borderWidth = 1.0f;
    self.friendImageView.layer.borderColor = [UIColor blackColor].CGColor;
    self.friendImageView.layer.cornerRadius = self.friendImageView.frame.size.width / 2;
    self.friendImageView.clipsToBounds = YES;
}

- (IBAction)tappedProfilePic:(id)sender {
    if([self.delegate respondsToSelector:@selector(didTapProfileImageOfFriend:)]) {
        [self.delegate didTapProfileImageOfFriend:self.friendObject];
    }
}

@end
