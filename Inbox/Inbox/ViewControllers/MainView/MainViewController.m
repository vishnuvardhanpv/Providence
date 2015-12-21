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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self addKeyboardNotifications];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self removeKeyBoardNotifications];
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

#pragma mark - UITextField delegate methods

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
}

#pragma mark - Keyboard Notifications

- (void)addKeyboardNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)removeKeyBoardNotifications {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWillShow:(NSNotification *)keyboardNotification {
    NSDictionary* userInfo = [keyboardNotification userInfo];
    NSTimeInterval animationDuration;
    [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    CGRect frame = [keyboardNotification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGRect newFrame = [self.view convertRect:frame
                                    fromView:[[UIApplication sharedApplication] delegate].window];
    self.textFieldContainerViewBottomConstraint.constant = newFrame.size.height - 40;
    [UIView animateWithDuration:animationDuration
                     animations:^{
                         [self.view layoutIfNeeded];
                     }
     ];
}

- (void)keyboardWillHide:(NSNotification *)keyboardNotification {
    self.textFieldContainerViewBottomConstraint.constant = 0;
    [self.textField resignFirstResponder];
    [self.view layoutIfNeeded];
}

@end
