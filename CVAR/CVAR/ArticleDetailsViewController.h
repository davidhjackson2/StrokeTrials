//
//  ArticleDetailsViewController.h
//  CVAR
//
//  Created by David Jackson on 2/15/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GamePickerViewController.h"

@class ArticleDetailsViewController;

@protocol ArticleDetailsViewControllerDelegate <NSObject>
- (void)articleDetailsViewControllerDidCancel:(ArticleDetailsViewController *)controller;
- (void)articleDetailsViewController:(ArticleDetailsViewController *)controller didAddArticle:(Article *)article;
@end

@interface ArticleDetailsViewController : UITableViewController <GamePickerViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@property (nonatomic, weak) id <ArticleDetailsViewControllerDelegate> delegate;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@end
