//
//  BaseViewController.h
//  Inbox
//
//  Created by Vishnu Vardhan PV on 17/12/15.
//  Copyright © 2015 Vishnu Vardhan PV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopBarViewController.h"
#import "BottomBarViewController.h"

@interface BaseViewController : UIViewController <TopBarProtocol> {
    TopBarViewController *topBarView;
    BottomBarViewController *bottomBarView;
}

@end
