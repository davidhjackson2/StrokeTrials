//
//  TrialDetailsViewController.m
//  StrokeTrials
//
//  Created by The Mullets on 2/28/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import "TrialDetailsViewController.h"
#import "TrialViewController.h"
#import "TrialWebViewController.h"

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
    self.navigationController.navigationBar.topItem.title = @"Back";
    self.titleLabel.text = [self.trial.title uppercaseString];
    self.yearLabel.text = self.trial.year;
    self.thmLabel.text = self.trial.thm;
    
    NSMutableString *resText = [NSMutableString string];
    for (NSString* result in self.trial.res) {
        if(![result  isEqual: @"\n"]) {
            [resText appendFormat:@"- %@\n", result];
        }
    }
    self.resLabel.text = resText;
    
    NSMutableString *limText = [NSMutableString string];
    for (NSString* limitation in self.trial.lim) {
        if(![limitation  isEqual: @"\n"]) {
            [limText appendFormat:@"- %@\n", limitation];
        }
    }
    self.limLabel.text = limText;
}

-(void)viewWillAppear:(BOOL)animated{
    self.title = self.trial.acro;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showLink"]) {
        [[segue destinationViewController] setAcro:self.trial.acro];
        [[segue destinationViewController] setLink:self.trial.link];
    }
}

@end