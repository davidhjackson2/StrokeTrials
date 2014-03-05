//
//  TrialDetailsViewController.h
//  StrokeTrials
//
//  Created by David Jackson on 2/28/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Trial.h"

@interface TrialDetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *thmLabel;
@property (weak, nonatomic) IBOutlet UILabel *urlLabel;
@property (weak, nonatomic) IBOutlet UITextView *resTextView;
@property (weak, nonatomic) IBOutlet UITextView *limTextView;

@property (nonatomic, strong) Trial *trial;

@end