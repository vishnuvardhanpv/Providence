//
//  MainViewController.h
//  Inbox
//
//  Created by Subin Kurian on 11/30/15.
//  Copyright © 2015 Subin Kurian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopBarViewController.h"
#import "BaseViewController.h"

@interface MainViewController : BaseViewController <UIGestureRecognizerDelegate> {
    CGRect rectContainer;
    bool arrowStyle;
    bool touchActionBool;
    bool dragImageActionBool;
}

@property (nonatomic, weak) IBOutlet UIView *mainContainerView;
@property (nonatomic, weak) IBOutlet UITextField *textField;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *textFieldContainerViewBottomConstraint;
@property (nonatomic,assign) CGRect openFrame;
@property (nonatomic,assign) CGRect closeFrame;


@end

