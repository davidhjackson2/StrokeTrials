//
//  TrialWebViewController.m
//  StrokeTrials
//
//  Created by The Mullets on 3/9/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import "TrialWebViewController.h"

@implementation TrialWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.topItem.title = @"Back";
    NSURL *myURL = [NSURL URLWithString: [self.link stringByAddingPercentEscapesUsingEncoding:
                                          NSUTF8StringEncoding]];
    NSURLRequest *request = [NSURLRequest requestWithURL:myURL];
    self.navigationItem.title = self.acro;
    [self.webView loadRequest:request];
}

@end