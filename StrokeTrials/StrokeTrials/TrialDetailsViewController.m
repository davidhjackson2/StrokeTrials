//
//  TrialDetailsViewController.m
//  StrokeTrials
//
//  Created by David Jackson on 2/28/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import "TrialDetailsViewController.h"

@interface TrialDetailsViewController ()

@end

@implementation TrialDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	self.title = self.trial.acro;
    self.titleLabel.text = [self.trial.title uppercaseString];
    self.yearLabel.text = self.trial.year;
    self.thmLabel.text = self.trial.thm;
    self.urlLabel.text = self.trial.url;
    
    NSMutableString *resText = [NSMutableString string];
    for (NSString* result in self.trial.res) {
        [resText appendFormat:@"- %@\n", result];
    }
    self.resTextView.text = resText;
    
    NSMutableString *limText = [NSMutableString string];
    for (NSString* limitation in self.trial.lim) {
        [limText appendFormat:@"- %@\n", limitation];
    }
    self.limTextView.text = limText;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end