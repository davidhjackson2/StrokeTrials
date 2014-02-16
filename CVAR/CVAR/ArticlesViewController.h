//
//  ArticlesViewController.h
//  CVAR
//
//  Created by David Jackson on 2/15/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleDetailsViewController.h"

@interface ArticlesViewController : UITableViewController <ArticleDetailsViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *articles;

@end
