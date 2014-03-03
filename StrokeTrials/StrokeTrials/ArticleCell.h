//
//  ArticleCell.h
//  StrokeTrials
//
//  Created by David Jackson on 2/15/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *acroLabel;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *yearLabel;
@property (nonatomic, weak) IBOutlet UILabel *urlLabel;
@property (nonatomic, weak) IBOutlet UILabel *resLabel;
@property (nonatomic, weak) IBOutlet UILabel *limLabel;
@property (nonatomic, weak) IBOutlet UILabel *thmLabel;

@end