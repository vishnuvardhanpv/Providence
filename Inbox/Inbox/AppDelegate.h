//
//  AppDelegate.h
//  Inbox
//
//  Created by Vishnu Vardhan PV on 15/12/15.
//  Copyright © 2015 Vishnu Vardhan PV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataManager.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) DataManager *dataManager;

+ (AppDelegate *)application;

@end

