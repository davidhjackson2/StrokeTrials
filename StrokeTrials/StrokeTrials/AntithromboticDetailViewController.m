//
//  AntithromboticDetailViewController.m
//  StrokeTrials
//
//  Created by The Mullets on 4/16/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import "AntithromboticDetailViewController.h"

@interface AntithromboticDetailViewController ()

@end

@implementation AntithromboticDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.antithrombotic.name;
    self.contentLabel.text = self.antithrombotic.content;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end