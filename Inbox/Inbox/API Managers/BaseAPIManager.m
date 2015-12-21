//
//  BaseAPIManager.m
//  Inbox
//
//  Created by Vishnu Vardhan PV on 19/12/15.
//  Copyright © 2015 Vishnu Vardhan PV. All rights reserved.
//

#import "BaseAPIManager.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"
#import "Utilities.h"
#import "AppDelegate.h"
#import "Constants.h"

NSString * const CONTENT_TYPE_JSON = @"text/html";

@implementation BaseAPIManager

+ (void) getRequestWithURLString:(NSString *)urlString
                   withParameter:(id)parameters
                     withSuccess:(void(^)(id object))successBlock
                         andFail:(void(^)(id errorObj))failBlock
                   showIndicator:(BOOL)shouldShowIndicator
{
    if (parameters) {
        [Utilities printJsonForDictFromRequest:parameters];
    }
    
    MBProgressHUD *HUD = [[MBProgressHUD alloc]initWithWindow:[[AppDelegate application] window]];
    if (shouldShowIndicator == true) {
        [Utilities showHUD:HUD overTheView:YES];
    }
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]
                                              initWithBaseURL:[NSURL URLWithString:BASE_URL]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:CONTENT_TYPE_JSON];
    manager.operationQueue.maxConcurrentOperationCount = 1;
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [manager GET:urlString
      parameters:parameters
         success:^(AFHTTPRequestOperation *operation,id responseObject) {
         [Utilities showHUD:HUD overTheView:NO];
         [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
             successBlock(responseObject);
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         [Utilities showHUD:HUD overTheView:NO];
         [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
         failBlock(error);
     }];
}

@end
