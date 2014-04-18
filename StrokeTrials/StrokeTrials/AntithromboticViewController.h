//
//  AntithromboticViewController.h
//  StrokeTrials
//
//  Created by The Mullets on 4/16/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Antithrombotic.h"
#import "AntithromboticCell.h"
#import "AntithromboticDetailViewController.h"

@interface AntithromboticViewController : UITableViewController <NSXMLParserDelegate> {
    NSXMLParser *parser;
    NSMutableDictionary *xmlDict;
    Antithrombotic *xmlAntithrombotic;
    NSString *element;
}

@end