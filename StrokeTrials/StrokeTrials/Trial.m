//
//  Trial.m
//  StrokeTrials
//
//  Created by The Mullets on 2/15/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import "Trial.h"

@implementation Trial

-(id) init {
    self.acro = [[NSMutableString alloc] init];
    self.title = [[NSMutableString alloc] init];
    self.journal = [[NSMutableString alloc] init];
    self.year = [[NSMutableString alloc] init];
    self.yearValue = [[NSMutableString alloc] init];
    self.bl = [[NSMutableString alloc] init];
    self.res = [[NSMutableArray alloc] init];
    self.lim = [[NSMutableArray alloc] init];
    self.link = [[NSMutableString alloc] init];
    self.tags = [[NSMutableString alloc] init];
    return self;
}

@end