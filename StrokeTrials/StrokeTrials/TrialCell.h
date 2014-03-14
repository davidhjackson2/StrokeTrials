//
//  TrialCell.h
//  StrokeTrials
//
//  Created by The Mullets on 2/15/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrialCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *acroLabel;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *yearLabel;

@end