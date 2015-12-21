//
//  Utilities.h
//  Inbox
//
//  Created by Vishnu Vardhan PV on 15/12/15.
//  Copyright © 2015 Vishnu Vardhan PV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface Utilities : NSObject

+ (UIColor *)applicationPinkColor;
+ (UIColor *)applicationYellowColor;
+ (UIColor *)applicationOrangeColor;
+ (UIColor *)applicationPurpleColor;
+ (void)saveApplicationBgColor:(UIColor *)color;
+ (UIColor *)getSavedApplicationBgColor;
+ (void)printJsonForDictFromRequest:(NSDictionary *)request;
+ (void)showHUD:(MBProgressHUD *)HUD overTheView:(BOOL)show;
+ (void)makeCircularImageView:(UIImageView *)imageView;

@end
