//
//  UserAPIManager.h
//  Inbox
//
//  Created by Vishnu Vardhan PV on 20/12/15.
//  Copyright © 2015 Vishnu Vardhan PV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserAPIManager : NSObject

+ (void)getTheProfileForTheUserID:(NSString *)userID
                 withSuccessBlock:(void(^)(id object))successBlock
                          andFail:(void(^)(NSError *errorMessage))failBlock;

@end
