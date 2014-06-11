//
//  AboutViewController.h
//  StrokeTrials
//
//  Created by The Mullets on 4/20/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController <NSXMLParserDelegate> {
    NSXMLParser *parser;
    NSMutableDictionary *xmlDict;
    NSString *element;
}

- (void)buttonPressed;

@end