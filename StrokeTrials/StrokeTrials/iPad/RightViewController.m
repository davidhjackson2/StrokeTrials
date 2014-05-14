//
//  RightViewController.m
//  StrokeTrials
//
//  Created by The Mullets on 4/11/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import "RightViewController.h"

@interface RightViewController ()

@end

@implementation RightViewController
{
    bool specLastChar;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self toggleView:false];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    scrollView.delegate = self;
    [scrollView setShowsHorizontalScrollIndicator:NO];
    [self refreshUI];
}

-(void)scrollViewDidScroll:(UIScrollView *)sView
{
    if (sView.contentOffset.x > 0 ||  scrollView.contentOffset.x < 0)
        sView.contentOffset = CGPointMake(0, sView.contentOffset.y);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    [self setTitleLabel:nil];
    [self setYearLabel:nil];
    [self setBlLabel:nil];
    [self setResLabel:nil];
    [self setLimLabel:nil];
}

-(void)setTrial:(Trial *)trial
{
    if (_trial != trial) {
        _trial = trial;
        [self refreshUI];
        [self.navigationController popViewControllerAnimated:YES];
        [self toggleView:true];
    }
}

-(void)refreshUI
{
    [scrollView setContentOffset:CGPointMake(0,-64) animated:NO];
    self.navigationController.navigationBar.topItem.title = @"Back";
    self.title = self.trial.acro;
    self.titleLabel.text = [self.trial.title uppercaseString];
    self.yearLabel.text = self.trial.year;
    self.blLabel.text = self.trial.bl;
    
    NSMutableString *resText = [NSMutableString string];
    for (NSString* result in self.trial.res) {
        if(specLastChar) {
            specLastChar = false;
            [resText appendFormat:@"%@\n", result];
        }
        else {
            if(![result  isEqual: @"\n"]) {
                if([result  isEqual: @"<"]) {
                    [resText length] < 1 ?[resText appendString: @"- "]:[resText deleteCharactersInRange:NSMakeRange([resText length]-1, 1)];
                    [resText appendString: @"<"];
                    specLastChar = true;
                }
                else if([result  isEqual: @">"]) {
                    [resText length] < 1 ?[resText appendString: @"- "]:[resText deleteCharactersInRange:NSMakeRange([resText length]-1, 1)];
                    [resText appendString: @">"];
                    specLastChar = true;
                }
                else if([result  isEqual: @"&"]) {
                    [resText length] < 1 ?[resText appendString: @"- "]:[resText deleteCharactersInRange:NSMakeRange([resText length]-1, 1)];
                    [resText appendString: @"&"];
                    specLastChar = true;
                }
                else if([result  isEqual: @"'"]) {
                    [resText length] < 1 ?[resText appendString: @"- "]:[resText deleteCharactersInRange:NSMakeRange([resText length]-1, 1)];
                    [resText appendString: @"'"];
                    specLastChar = true;
                }
                else if([result  isEqual: @"\""]) {
                    [resText length] < 1 ?[resText appendString: @"- "]:[resText deleteCharactersInRange:NSMakeRange([resText length]-1, 1)];
                    [resText appendString: @"\""];
                    specLastChar = true;
                }
                else {
                    [resText appendFormat:@"- %@\n", result];
                }
            }
        }
    }
    self.resLabel.text = resText;
    
    NSMutableString *limText = [NSMutableString string];
    for (NSString* limitation in self.trial.lim) {
        if(specLastChar) {
            specLastChar = false;
            [limText appendFormat:@"%@\n", limitation];
        }
        else {
            if(![limitation  isEqual: @"\n"]) {
                if([limitation  isEqual: @"<"]) {
                    [limText length] < 1 ?[limText appendString: @"- "]:[limText deleteCharactersInRange:NSMakeRange([limText length]-1, 1)];
                    [limText appendString: @"<"];
                    specLastChar = true;
                }
                else if([limitation isEqual: @">"]) {
                    [limText length] < 1 ?[limText appendString: @"- "]:[limText deleteCharactersInRange:NSMakeRange([limText length]-1, 1)];
                    [limText appendString: @">"];
                    specLastChar = true;
                }
                else if([limitation isEqual: @"&"]) {
                    [limText length] < 1 ?[limText appendString: @"- "]:[limText deleteCharactersInRange:NSMakeRange([limText length]-1, 1)];
                    [limText appendString: @"&"];
                    specLastChar = true;
                }
                else if([limitation isEqual: @"'"]) {
                    [limText length] < 1 ?[limText appendString: @"- "]:[limText deleteCharactersInRange:NSMakeRange([limText length]-1, 1)];
                    [limText appendString: @"'"];
                    specLastChar = true;
                }
                else if([limitation isEqual: @"\""]) {
                    [limText length] < 1 ?[limText appendString: @"- "]:[limText deleteCharactersInRange:NSMakeRange([limText length]-1, 1)];
                    [limText appendString: @"\""];
                    specLastChar = true;
                }
                else {
                    [limText appendFormat:@"- %@\n", limitation];
                }
            }
        }
    }
    self.limLabel.text = limText;
}

-(void)selectedTrial:(Trial *)newTrial
{
    [self setTrial:newTrial];
}

- (IBAction)share:(id)sender
{
    NSString *subject = self.trial.acro;
    NSString *messageBody = [NSString stringWithFormat:@"<html><body><br\\>Check out this article I found using the free <a href=''>Stroke Trials</a> iOS app.</br></br><a href='%@'>%@</br></a><b>%@</b></br><i>%@</i></br>%@</body></html>", self.trial.link, self.trial.acro, self.trial.title, self.trial.journal, self.trial.year];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:subject];
    [mc setMessageBody:messageBody isHTML:true];
    
    [self presentViewController:mc animated:YES completion:NULL];
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showLink"]) {
        [[segue destinationViewController] setAcro:self.trial.acro];
        [[segue destinationViewController] setJournal:self.trial.journal];
        [[segue destinationViewController] setLink:self.trial.link];
        [[segue destinationViewController] setTitle:self.trial.title];
        [[segue destinationViewController] setYearValue:self.trial.year];
    }
}

- (void)toggleView:(bool)visible {
    if(visible) {
        self.navigationController.navigationBar.topItem.rightBarButtonItem.title = @"Share";
        self.blTitleLabel.hidden=NO;
        self.resTitleLabel.hidden=NO;
        self.limTitleLabel.hidden=NO;
        self.linkButton.hidden=NO;
    }
    else {
        self.navigationController.navigationBar.topItem.rightBarButtonItem.title = nil;
        [self selectedTrial:nil];
        self.blTitleLabel.hidden=YES;
        self.resTitleLabel.hidden=YES;
        self.limTitleLabel.hidden=YES;
        self.linkButton.hidden=YES;
    }
}

@end