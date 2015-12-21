//
//  FriendViewController.h
//  Inbox
//
//  Created by Vishnu Vardhan PV on 16/12/15.
//  Copyright © 2015 Vishnu Vardhan PV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "Friend.h"

@interface FriendViewController : BaseViewController

@property (nonatomic, strong) Friend *friendObj;
@property (nonatomic, weak) IBOutlet UIImageView *profileImageView;
@property (nonatomic, weak) IBOutlet UILabel *usernameLabel;

@end