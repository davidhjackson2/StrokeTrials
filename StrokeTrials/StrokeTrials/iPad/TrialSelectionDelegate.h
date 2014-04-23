//
//  TrialSelectionDelegate.h
//  StrokeTrials
//
//  Created by The Mullets on 4/11/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import "Trial.h"

@protocol TrialSelectionDelegate <NSObject>

-(void)selectedTrial:(Trial *)newTrial;
-(void)toggleView:(bool)visible;

@end