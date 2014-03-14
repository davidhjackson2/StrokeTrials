//
//  TrialCell.m
//  StrokeTrials
//
//  Created by The Mullets on 2/15/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import "TrialCell.h"

@implementation TrialCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end