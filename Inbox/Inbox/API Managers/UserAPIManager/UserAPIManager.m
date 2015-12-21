//
//  UserAPIManager.m
//  Inbox
//
//  Created by Vishnu Vardhan PV on 20/12/15.
//  Copyright © 2015 Vishnu Vardhan PV. All rights reserved.
//

#import "UserAPIManager.h"
#import "BaseAPIManager.h"
#import "Constants.h"

@implementation UserAPIManager

+ (void)getTheProfileForTheUserID:(NSString *)userID
                      withSuccessBlock:(void(^)(id object))successBlock
                               andFail:(void(^)(NSError *errorMessage))failBlock {
    NSString *urlString = [NSString stringWithFormat:@"%@%@%@", BASE_URL, GET_USER_PROFILE_URL, userID];
    [BaseAPIManager getRequestWithURLString:urlString
                              withParameter:nil
                                withSuccess:^(id object) {
                                    successBlock(object);
                                } andFail:^(id errorObj) {
                                    failBlock(errorObj);
                                } showIndicator:YES];
}

@end
