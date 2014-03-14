//
//  TrialDetailsViewController.h
//  StrokeTrials
//
//  Created by The Mullets on 2/28/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Trial.h"

@interface TrialDetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *thmLabel;
@property (weak, nonatomic) IBOutlet UILabel *resLabel;
@property (weak, nonatomic) IBOutlet UILabel *limLabel;

@property (nonatomic, strong) Trial *trial;

@end