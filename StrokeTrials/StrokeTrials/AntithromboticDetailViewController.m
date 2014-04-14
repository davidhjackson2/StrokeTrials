//
//  AntithromboticDetailViewController.m
//  AntithromboticApp
//
//  Created by Simon on 23/12/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "AntithromboticDetailViewController.h"

@interface AntithromboticDetailViewController ()

@end

@implementation AntithromboticDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	self.title = self.Antithrombotic.name;
    self.lnameLabel.text = self.Antithrombotic.lname;
    self.ingredientsTextView.text = self.Antithrombotic.ingredients;
    
    /*NSMutableString *ingredientsText = [NSMutableString string];
    for (NSString* ingredient in self.Antithrombotic.ingredients) {
        [ingredientsText appendFormat:@"%@\n", ingredient];
    }
    self.ingredientsTextView.text = ingredientsText;*/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
