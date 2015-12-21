//
//  Utilities.m
//  Inbox
//
//  Created by Vishnu Vardhan PV on 15/12/15.
//  Copyright © 2015 Vishnu Vardhan PV. All rights reserved.
//

#import "Utilities.h"
#import "Constants.h"
#import "AppDelegate.h"

@implementation Utilities

+ (UIColor *)applicationPinkColor {
    return [UIColor colorWithRed:231/255.0f green:86/255.0f blue:153/255.0f alpha:1.0];
}

+ (UIColor *)applicationYellowColor {
    return [UIColor colorWithRed:240/255.0f green:193/255.0f blue:0 alpha:1.0];
}

+ (UIColor *)applicationOrangeColor {
    return [UIColor colorWithRed:249/255.0f green:147/255.0f blue:21/255.0f alpha:1.0];
}

+ (UIColor *)applicationPurpleColor {
    return [UIColor colorWithRed:69/255.0f green:33/255.0f blue:98/255.0f alpha:1.0];
}

+ (void)saveApplicationBgColor:(UIColor *)color {
    NSData *colorData = [NSKeyedArchiver archivedDataWithRootObject:color];
    [[NSUserDefaults standardUserDefaults] setObject:colorData forKey:APP_BG_COLOR_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (UIColor *)getSavedApplicationBgColor {
    NSData *colorData = [[NSUserDefaults standardUserDefaults] objectForKey:APP_BG_COLOR_KEY];
    UIColor *color = [NSKeyedUnarchiver unarchiveObjectWithData:colorData];
    return color;
}

+ (void)printJsonForDictFromRequest:(NSDictionary *)request {
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:request
                                                       options:0
                                                         error:nil];
    if (jsonData) {
        NSString *JSONString __attribute__((unused))  = [[NSString alloc]
                                                         initWithBytes:[jsonData bytes]
                                                         length:[jsonData length]
                                                         encoding:NSUTF8StringEncoding];
        NSLog(@" REQUEST \n %@ ",JSONString);
    }
}

+ (void)showHUD:(MBProgressHUD *)HUD overTheView:(BOOL)show {
    HUD.labelText = @"Loading";
    HUD.labelColor = [UIColor whiteColor];
    
    if (show) {
        [[(AppDelegate *)[[UIApplication sharedApplication] delegate] window] addSubview:HUD];
        [HUD show:YES];
    }
    else {
        [HUD removeFromSuperview];
    }
}

+ (void)makeCircularImageView:(UIImageView *)imageView {
    imageView.layer.borderWidth = 1.0f;
    imageView.layer.borderColor = [UIColor blackColor].CGColor;
    imageView.layer.cornerRadius = imageView.frame.size.width / 2;
    imageView.clipsToBounds = YES;
}

@end
