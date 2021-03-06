//
//  TrialWebViewController.h
//  StrokeTrials
//
//  Created by The Mullets on 3/9/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import <MessageUI/MessageUI.h>
#import <UIKit/UIKit.h>
#import "Reachability.h"

@interface TrialWebViewController : UIViewController <UIWebViewDelegate> {
    IBOutlet UIWebView *webView;
    IBOutlet UIActivityIndicatorView *activityIndicatorView;
    NSTimer *timer;
}

@property (copy, nonatomic) NSMutableString *acro;
@property (copy, nonatomic) NSMutableString *journal;
@property (copy, nonatomic) NSMutableString *link;
@property (copy, nonatomic) NSMutableString *title;
@property (copy, nonatomic) NSMutableString *yearValue;
@property (copy, nonatomic) NSMutableString *check;

@end