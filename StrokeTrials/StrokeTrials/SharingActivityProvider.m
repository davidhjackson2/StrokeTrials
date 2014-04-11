//
//  SharingActivityProvider.m
//  StrokeTrials
//
//  Created by Brenden Leonard on 4/11/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import "SharingActivityProvider.h"

@implementation SharingActivityProvider {
}

-(id)activityViewController:(UIActivityViewController *)activityViewController itemForActivityType:(NSString *)activityType {
    NSLog(@"%@", activityType);
    
    NSString *shareString = @"Check out this article I found using the free ";
    
    if ([activityType isEqualToString:UIActivityTypePostToFacebook]) {
        shareString = [NSString stringWithFormat:@"Attention Facebook: %@", shareString];
    } else if ([activityType isEqualToString:UIActivityTypeMessage]) {
        shareString = [NSString stringWithFormat:@"%@", shareString];
    } else if ([activityType isEqualToString:UIActivityTypeMail]) {
        shareString = [NSString stringWithFormat:@"%@", shareString];
    }
    
    return shareString;
}

- (id)activityViewControllerPlaceholderItem:(UIActivityViewController *)activityViewController {
    return @"";
}
@end
