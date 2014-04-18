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
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Network Error" message:@"The Internet connection appears to be offline." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
    [super viewDidLoad];
    webview.delegate = self;
    activity.hidesWhenStopped = YES;
    NSURL *myURL = [NSURL URLWithString: [self.link stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest *request = [NSURLRequest requestWithURL:myURL];
    self.navigationItem.title = self.acro;
    [self.webView loadRequest:request];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(loading) userInfo:nil repeats:YES];
}

- (IBAction)share:(id)sender
{
    NSString *subject = self.acro;
    NSString *messageBody = [NSString stringWithFormat:@"<html><body><br\\>Check out this article I found using the free <a href='https://itunes.apple.com/us/app/acs-trials/id451326968?mt=8'>Stroke Trials</a> iOS app.</br></br><a href='%@'>%@</br></a>%@</body></html>", self.link, self.acro, self.title];
    
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

-(void)loading {
    if (!webview.loading)
        [activity stopAnimating];
    else
        [activity startAnimating];
}

-(void)webViewDidStartLoad:(UIWebView *) webView {
    [activity startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *) webView {
    [activity stopAnimating];
}

@end