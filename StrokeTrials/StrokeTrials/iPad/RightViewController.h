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

@interface RightViewController : UIViewController <UISplitViewControllerDelegate, TrialSelectionDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *blLabel;
@property (weak, nonatomic) IBOutlet UILabel *resLabel;
@property (weak, nonatomic) IBOutlet UILabel *limLabel;

@property (nonatomic, strong) Trial *trial;

@end