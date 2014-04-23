//
//  RightViewController.m
//  StrokeTrials
//
//  Created by The Mullets on 4/11/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import "RightViewController.h"

@interface RightViewController () <MFMailComposeViewControllerDelegate>

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

-(void)scrollViewDidScroll:(UIScrollView *)scllView
{
    if (scllView.contentOffset.x > 0 ||  scrollView.contentOffset.x < 0)
        scllView.contentOffset = CGPointMake(0, scllView.contentOffset.y);
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
        [scrollView setContentOffset:CGPointMake(0,-64) animated:NO];
        [self refreshUI];
        [self.navigationController popViewControllerAnimated:YES];
        [self toggleView:true];
    }
}

-(void)refreshUI
{
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
    NSString *messageBody = [NSString stringWithFormat:@"<html><body><br\\>Check out this article I found using the free <a href='https://itunes.apple.com/us/app/acs-trials/id451326968?mt=8'>Stroke Trials</a> iOS app.</br></br><a href='%@'>%@</br></a>%@</body></html>", self.trial.link, self.trial.acro, self.trial.title];
    
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
        [[segue destinationViewController] setLink:self.trial.link];
        [[segue destinationViewController] setTitle:self.trial.title];
    }
}

- (void)toggleView:(bool)visible {
    if(visible) {
        scrollView.hidden=NO;
    }
    else {
        scrollView.hidden=YES;
    }
}

@end