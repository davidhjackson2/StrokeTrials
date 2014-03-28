//
//  Parser.m
//  StrokeTrials
//
//  Created by David Jackson on 3/27/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import "Parser.h"
#import "Trial.h"

@implementation Parser
{
    NSMutableArray *trials;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    element = elementName;
    if ([element isEqualToString:@"trial"]) {
        xmlTrial   = [[NSMutableDictionary alloc] init];
        trial  = [[Trial alloc] init];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:@"trial"]) {
        [xmlTrial setObject:trial forKey:@"trial"];
        [trials addObject:[xmlTrial copy]];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if ([element isEqualToString:@"acro"]) {
        [trial.acro appendString:string];
    } else if ([element isEqualToString:@"title"]) {
        [trial.title appendString:string];
    } else if ([element isEqualToString:@"link"]) {
        [trial.link appendString:string];
    } else if ([element isEqualToString:@"year"]) {
        [trial.year appendString:string];
    } else if ([element isEqualToString:@"bl"]) {
        [trial.bl appendString:string];
    } else if ([element isEqualToString:@"res"]) {
        [trial.res addObject:string];
    } else if ([element isEqualToString:@"lim"]) {
        [trial.lim addObject:string];
    }
}

/*
- (void)parserDidEndDocument:(NSXMLParser *)parser {
    [self.tableView reloadData];
}
 */

@end