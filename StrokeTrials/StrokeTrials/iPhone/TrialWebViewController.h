//
//  TrialWebViewController.h
//  StrokeTrials
//
//  Created by The Mullets on 3/9/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrialWebViewController : UIViewController

@property (copy, nonatomic) NSMutableString *acro;
@property (copy, nonatomic) NSMutableString *link;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end