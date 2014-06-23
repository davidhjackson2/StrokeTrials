//
//  TrialWebViewController.m
//  StrokeTrials
//
//  Created by The Mullets on 3/9/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import "TrialWebViewController.h"

@interface TrialWebViewController () <MFMailComposeViewControllerDelegate>

@end

@implementation TrialWebViewController

- (void)viewDidLoad {
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    if (networkStatus == NotReachable) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Network Error" message:@"An Internet connection is required to access the article." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
    [super viewDidLoad];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.navigationController.navigationBar.topItem.title = @"Back";
    }
    
    webView.delegate = self;
    activityIndicatorView.hidesWhenStopped = YES;
    NSURL *myURL = [NSURL URLWithString: [self.link stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest *request = [NSURLRequest requestWithURL:myURL];
    self.navigationItem.title = self.acro;
    [webView loadRequest:request];
}

- (IBAction)share:(id)sender
{
    NSString *subject = self.acro;
    NSString *messageBody = [NSString stringWithFormat:@"<html><body><br\\>Check out this article I found using the free <a href=''>Stroke Trials</a> iOS app.</br></br><a href='%@'>%@</br></br></a><b>%@</b></br></br><i>%@</i></br></br>%@</body></html>", self.link, self.acro, self.title, self.journal, self.yearValue];
    
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

-(void)webViewDidStartLoad:(UIWebView *)webView {
    [activityIndicatorView startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *) webView {
    [activityIndicatorView stopAnimating];
    activityIndicatorView = nil;
}

-(BOOL) webView:(UIWebView *)inWeb shouldStartLoadWithRequest:(NSURLRequest *)inRequest navigationType:(UIWebViewNavigationType)inType {
    if (inType == UIWebViewNavigationTypeLinkClicked) {
        [[UIApplication sharedApplication] openURL:[inRequest URL]];
        return NO;
    }
    return YES;
}

@end