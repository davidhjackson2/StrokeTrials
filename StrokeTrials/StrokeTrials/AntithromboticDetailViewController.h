//
//  AntithromboticDetailViewController.h
//  StrokeTrials
//
//  Created by The Mullets on 4/16/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Antithrombotic.h"

@interface AntithromboticDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (nonatomic, strong) Antithrombotic *antithrombotic;

@end