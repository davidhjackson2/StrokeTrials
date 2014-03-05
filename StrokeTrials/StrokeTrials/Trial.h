//
//  Trial.h
//  StrokeTrials
//
//  Created by David Jackson on 2/15/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Trial : NSObject

@property (nonatomic, strong) NSString *acro;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *year;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSArray *res;
@property (nonatomic, strong) NSArray *lim;
@property (nonatomic, strong) NSString *thm;

@end