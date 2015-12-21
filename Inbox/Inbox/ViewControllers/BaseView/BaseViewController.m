//
//  BaseViewController.m
//  Inbox
//
//  Created by Vishnu Vardhan PV on 17/12/15.
//  Copyright © 2015 Vishnu Vardhan PV. All rights reserved.
//

#import "BaseViewController.h"
#import "Utilities.h"
#import "MeViewController.h"
#import "ContactViewController.h"
#import "Constants.h"

@implementation BaseViewController

- (void)viewDidLoad {
    [self.navigationController setNavigationBarHidden:YES];
    [self addTopBarView];
    [self addBottomBarView];
    [self setUpUI];
}

-(void)setUpUI {
    [self.view setBackgroundColor:[Utilities getSavedApplicationBgColor]];
}

- (void)addTopBarView {
    topBarView = [self.storyboard instantiateViewControllerWithIdentifier:TopBarView];
    [topBarView.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    [topBarView.view setBackgroundColor:[Utilities getSavedApplicationBgColor]];
    topBarView.delegate = self;
    [self addChildViewController:topBarView];
    [self.view addSubview:topBarView.view];
    [topBarView didMoveToParentViewController:self];
}

- (void)addBottomBarView {
    bottomBarView = [self.storyboard instantiateViewControllerWithIdentifier:BottomBarView];
    [self addChildViewController:bottomBarView];
    [self.view addSubview:bottomBarView.view];
    [bottomBarView didMoveToParentViewController:self];
    [bottomBarView.view setFrame:CGRectMake(0, self.view.frame.size.height - 40, bottomBarView.view.frame.size.width, bottomBarView.view.frame.size.height)];
}

- (IBAction)tappedBackButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - TopBarProtocol methods

- (void)didSelectBgColor:(UIColor *)color {
    [self.view setBackgroundColor:[Utilities getSavedApplicationBgColor]];
}

- (void)didTapCameraButton {
    
}

- (void)didTapMeButton {
    MeViewController *meView = [[MeViewController alloc] init];
    meView = [self.storyboard instantiateViewControllerWithIdentifier:MeView];
    [self.navigationController pushViewController:meView animated:YES];
}

- (void)didTapContactButton {
    ContactViewController *contactView = [[ContactViewController alloc] init];
    contactView = [self.storyboard instantiateViewControllerWithIdentifier:ContactView];
    [self.navigationController pushViewController:contactView animated:YES];
}

@end
