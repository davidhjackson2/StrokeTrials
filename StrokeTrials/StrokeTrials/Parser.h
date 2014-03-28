//
//  Parser.h
//  StrokeTrials
//
//  Created by David Jackson on 3/27/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Trial.h"

@interface Parser : NSObject <NSXMLParserDelegate> {
    NSXMLParser *parser;
    NSMutableDictionary *xmlTrial;
    Trial *trial;
    NSString *element;
}

@end