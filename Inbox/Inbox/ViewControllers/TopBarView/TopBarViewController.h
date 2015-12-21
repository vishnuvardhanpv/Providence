//
//  TopBarViewController.h
//  Inbox
//
//  Created by Vishnu Vardhan PV on 15/12/15.
//  Copyright © 2015 Vishnu Vardhan PV. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TopBarProtocol;

@interface TopBarViewController : UIViewController

@property (nonatomic, strong) id <TopBarProtocol> delegate;

@end

@protocol TopBarProtocol <NSObject>

- (void)didSelectBgColor:(UIColor *)color;
- (void)didTapCameraButton;
- (void)didTapMeButton;
- (void)didTapContactButton;

@end