//
//  GroupsCollectionViewCell.m
//  Inbox
//
//  Created by Vishnu Vardhan PV on 20/12/15.
//  Copyright © 2015 Vishnu Vardhan PV. All rights reserved.
//

#import "GroupsCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@implementation GroupsCollectionViewCell

- (void)populateCell:(Group *)groupModel {
    [self makeCircularImageView];
    self.groupObject = groupModel;
    [self.groupImageView sd_setImageWithURL:[NSURL URLWithString:groupModel.groupIcon]];
    self.groupNameLabel.text = groupModel.groupTitle;
}

- (void)makeCircularImageView {
    self.groupImageView.layer.borderWidth = 1.0f;
    self.groupImageView.layer.borderColor = [UIColor blackColor].CGColor;
    self.groupImageView.layer.cornerRadius = self.groupImageView.frame.size.width / 2;
    self.groupImageView.clipsToBounds = YES;
}

- (IBAction)tappedGroupPic:(id)sender {
    if([self.delegate respondsToSelector:@selector(didTapImageOfGroup:)]) {
        [self.delegate didTapImageOfGroup:self.groupObject];
    }
}

@end
