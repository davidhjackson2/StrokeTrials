//
//  LeftViewController.h
//  StrokeTrials
//
//  Created by The Mullets on 4/11/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"
#import "Trial.h"
#import "TrialCell.h"
#import "TrialSelectionDelegate.h"

@interface LeftViewController : UITableViewController <NSXMLParserDelegate> {
    NSXMLParser *parser;
    NSMutableDictionary *xmlDict;
    Trial *xmlTrial;
    NSString *element;
}

@property (nonatomic, strong) NSMutableArray *trials;
@property (nonatomic, assign) id<TrialSelectionDelegate> delegate;

@end