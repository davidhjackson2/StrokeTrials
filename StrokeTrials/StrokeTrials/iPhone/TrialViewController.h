//
//  TrialViewController.h
//  StrokeTrials
//
//  Created by The Mullets on 2/15/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoreViewController.h"
#import "Reachability.h"
#import "Trial.h"
#import "TrialCell.h"
#import "TrialDetailViewController.h"

@interface TrialViewController : UITableViewController <NSXMLParserDelegate> {
    NSXMLParser *parser;
    NSMutableDictionary *xmlDict;
    Trial *xmlTrial;
    NSString *element;
}

@end