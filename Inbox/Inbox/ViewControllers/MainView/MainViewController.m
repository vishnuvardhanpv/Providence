//
//  MainViewController.m
//  Inbox
//
//  Created by Subin Kurian on 11/30/15.
//  Copyright © 2015 Subin Kurian. All rights reserved.
//

#import "MainViewController.h"
#import "Utilities.h"
#import "Constants.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)setUpUI {
    [_mainContainerView setBackgroundColor:[Utilities getSavedApplicationBgColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TopBarProtocol methods

- (void)didSelectBgColor:(UIColor *)color {
    [self.mainContainerView setBackgroundColor:color];
}

@end
