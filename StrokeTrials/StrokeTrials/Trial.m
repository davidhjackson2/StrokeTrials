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
    self.year = [[NSMutableString alloc] init];
    self.link = [[NSMutableString alloc] init];
    self.res = [[NSMutableArray alloc] init];
    self.lim = [[NSMutableArray alloc] init];
    self.thm = [[NSMutableString alloc] init];
    return self;
}

@end