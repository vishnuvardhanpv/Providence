//
//  GroupViewController.m
//  Inbox
//
//  Created by Vishnu Vardhan PV on 20/12/15.
//  Copyright © 2015 Vishnu Vardhan PV. All rights reserved.
//

#import "GroupViewController.h"
#import "UIImageView+WebCache.h"
#import "Friend.h"
#import "Utilities.h"

NSString *const GroupCellId = @"GroupCellId";

@implementation GroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureAndPopulateImageView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return [self.groupObj.members count];
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:GroupCellId forIndexPath:indexPath];
    Friend *friendObj = [self.groupObj.members objectAtIndex:indexPath.row];
    UIImageView *imageView = [cell viewWithTag:1];
    [Utilities makeCircularImageView:imageView];
    [imageView sd_setImageWithURL:[NSURL URLWithString:friendObj.profilePic]];
    return cell;
}

- (void)configureAndPopulateImageView {
    self.profileImageView.layer.cornerRadius = 10.0;
    self.profileImageView.clipsToBounds = YES;
    [self.profileImageView sd_setImageWithURL:[NSURL URLWithString:self.groupObj.groupIcon]];
}

@end
