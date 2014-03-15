//
//  TrialViewController.h
//  StrokeTrials
//
//  Created by The Mullets on 2/15/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Trial.h"

@interface TrialViewController : UITableViewController <NSXMLParserDelegate> {
    NSXMLParser         *parser;
    NSMutableDictionary *xmlTrial;
    Trial               *trial;
    NSString            *element;
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end