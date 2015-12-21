//
//  TopBarViewController.m
//  Inbox
//
//  Created by Vishnu Vardhan PV on 15/12/15.
//  Copyright © 2015 Vishnu Vardhan PV. All rights reserved.
//

#import "TopBarViewController.h"
#import "Utilities.h"

@implementation TopBarViewController

#pragma mark - IBActions

- (IBAction)tappedBgColorSelectionButton:(id)sender {
    UIButton *button = (UIButton *)sender;
    switch (button.tag) {
        case 0:
            [self.view setBackgroundColor:[Utilities applicationPinkColor]];
            break;
        case 1:
            [self.view setBackgroundColor:[Utilities applicationYellowColor]];
            break;
        case 2:
            [self.view setBackgroundColor:[Utilities applicationOrangeColor]];
            break;
        case 3:
            [self.view setBackgroundColor:[Utilities applicationPurpleColor]];
            break;
        case 4:
            [self.view setBackgroundColor:[UIColor blackColor]];
            break;
        default:
            break;
    }
    if([self.delegate respondsToSelector:@selector(didSelectBgColor:)]) {
        [self.delegate didSelectBgColor:self.view.backgroundColor];
    }
    [Utilities saveApplicationBgColor:self.view.backgroundColor];
}

- (IBAction)tappedCameraButton:(id)sender {
    if([self.delegate respondsToSelector:@selector(didTapCameraButton)]) {
        [self.delegate didTapCameraButton];
    }
}

- (IBAction)tappedMeButton:(id)sender {
    if([self.delegate respondsToSelector:@selector(didTapMeButton)]) {
        [self.delegate didTapMeButton];
    }
}

- (IBAction)tappedContactButton:(id)sender {
    if([self.delegate respondsToSelector:@selector(didTapContactButton)]) {
        [self.delegate didTapContactButton];
    }
}

@end
