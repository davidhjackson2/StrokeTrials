//
//  RightViewController.h
//  StrokeTrials
//
//  Created by The Mullets on 4/11/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import <MessageUI/MessageUI.h>
#import <UIKit/UIKit.h>
#import "LeftViewController.h"
#import "Trial.h"
#import "TrialSelectionDelegate.h"

@interface RightViewController : UIViewController <MFMailComposeViewControllerDelegate, TrialSelectionDelegate, UIScrollViewDelegate, UISplitViewControllerDelegate> {
    IBOutlet UIScrollView *scrollView;
}

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *blTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *blLabel;
@property (weak, nonatomic) IBOutlet UILabel *resTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *resLabel;
@property (weak, nonatomic) IBOutlet UILabel *limTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *limLabel;
@property (weak, nonatomic) IBOutlet UIButton *linkButton;
@property (weak, nonatomic) IBOutlet UINavigationItem *shareButton;

@property (nonatomic, strong) Trial *trial;

-(void)toggleView:(bool)visible;

@end