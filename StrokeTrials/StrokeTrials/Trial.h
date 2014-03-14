//
//  Trial.h
//  StrokeTrials
//
//  Created by The Mullets on 2/15/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Trial : NSObject

@property (nonatomic, strong) NSMutableString *acro;
@property (nonatomic, strong) NSMutableString *title;
@property (nonatomic, strong) NSMutableString *year;
@property (nonatomic, strong) NSMutableString *link;
@property (nonatomic, strong) NSMutableArray *res;
@property (nonatomic, strong) NSMutableArray *lim;
@property (nonatomic, strong) NSMutableString *thm;

@end