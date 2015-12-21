//
//  GroupViewController.h
//  Inbox
//
//  Created by Vishnu Vardhan PV on 20/12/15.
//  Copyright © 2015 Vishnu Vardhan PV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "Group.h"

@interface GroupViewController : BaseViewController

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic, weak) IBOutlet UIImageView *profileImageView;
@property (nonatomic, weak) Group *groupObj;

@end
