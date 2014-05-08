//
//  MoreViewController.m
//  StrokeTrials
//
//  Created by The Mullets on 3/24/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController () <MFMailComposeViewControllerDelegate>

@end

@implementation MoreViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.topItem.title = @"Back";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2)
    {
        [self showEmail];
    }
}

- (void)showEmail
{
    NSString *subject = @"Stroke Trials App - Feedback";
    NSArray *toRecipients = [NSArray arrayWithObject:@"stroketrialsapp@gmail.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:subject];
    [mc setToRecipients:toRecipients];
    
    [self presentViewController:mc animated:YES completion:NULL];
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end