//
//  Friend.m
//  Inbox
//
//  Created by Vishnu Vardhan PV on 19/12/15.
//  Copyright © 2015 Vishnu Vardhan PV. All rights reserved.
//

#import "Friend.h"

@implementation Friend

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    // properties defined in header < : > key in JSON Dictionary
    return @{
             @"country" : @"country",
             @"dob" : @"dob",
             @"email" : @"email",
             @"firstName" : @"first_name",
             @"lastName" : @"last_name",
             @"friendId" : @"friend_id",
             @"mobile" : @"mobile",
             @"profilePic" : @"profile_pic",
             @"status" : @"status",
             @"role" : @"role",
             @"userId" : @"user_id",
             @"loginId" : @"login_id",
             @"userType" : @"user_type"
             };
}

@end
