//
//  FriendsAPIManager.m
//  Inbox
//
//  Created by Vishnu Vardhan PV on 19/12/15.
//  Copyright © 2015 Vishnu Vardhan PV. All rights reserved.
//

#import "FriendsAPIManager.h"
#import "Constants.h"
#import "BaseAPIManager.h"

@implementation FriendsAPIManager

+ (void)getTheListOfFriendsForTheUserID:(NSString *)userID
                  withSuccessBlock:(void(^)(id object))successBlock
                           andFail:(void(^)(NSError *errorMessage))failBlock {
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@%@", BASE_URL, GET_FRIENDS_URL, userID];
    [BaseAPIManager getRequestWithURLString:urlString
                                withParameter:nil
                                  withSuccess:^(id object) {
                                      successBlock(object);
                                  } andFail:^(id errorObj) {
                                      failBlock(errorObj);
                                  } showIndicator:YES];
}

@end
