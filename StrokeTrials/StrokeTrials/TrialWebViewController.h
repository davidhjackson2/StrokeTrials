//
//  TrialWebViewController.h
//  StrokeTrials
//
//  Created by The Mullets on 3/9/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import <MessageUI/MessageUI.h>
#import <UIKit/UIKit.h>

@interface TrialWebViewController : UIViewController <UIWebViewDelegate> {
    IBOutlet UIWebView *webview;
    IBOutlet UIActivityIndicatorView *activityind;
    NSTimer *timer;
}

@property (copy, nonatomic) NSMutableString *acro;
@property (copy, nonatomic) NSMutableString *link;
@property (copy, nonatomic) NSMutableString *title;

@end