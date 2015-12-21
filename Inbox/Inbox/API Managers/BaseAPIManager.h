//
//  BaseAPIManager.h
//  Inbox
//
//  Created by Vishnu Vardhan PV on 19/12/15.
//  Copyright © 2015 Vishnu Vardhan PV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseAPIManager : NSObject

+ (void) getRequestWithURLString:(NSString *)urlString
                   withParameter:(id)parameters
                     withSuccess:(void(^)(id object))successBlock
                         andFail:(void(^)(id errorObj))failBlock
                   showIndicator:(BOOL)shouldShowIndicator;

@end
