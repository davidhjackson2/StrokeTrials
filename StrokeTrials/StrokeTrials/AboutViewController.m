//
//  AboutViewController.m
//  StrokeTrials
//
//  Created by The Mullets on 4/20/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import "AboutViewController.h"

int nextLabel = 65;
NSString *anyUrl = @"";
NSString *anyUrlText = @"";

@interface AboutViewController ()

@end

@implementation AboutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSURL *url = [NSURL URLWithString:@"https://sites.google.com/site/stroketrialsapp/home/manager/About.xml"];
        parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
        [parser setDelegate:self];
        [parser setShouldResolveExternalEntities:NO];
        [parser parse];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"https://sites.google.com/site/stroketrialsapp/home/manager/About.xml"];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
    
    nextLabel = 65;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Navigation

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    element = elementName;
    if ([element isEqualToString:@"about"]) {
        xmlDict = [[NSMutableDictionary alloc] init];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        if ([element isEqualToString:@"section"]) {
            if (![string isEqualToString: @"\n"]) {
                UILabel *headingLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, nextLabel += 10, 300, 16)];
                nextLabel += 25;
                [headingLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:14.0]];
                headingLabel.text = string;
                headingLabel.textAlignment = NSTextAlignmentCenter;
                [self.view addSubview:headingLabel];
            }
        } else if ([element isEqualToString:@"info"]) {
            if (![string isEqualToString: @"\n"]) {
                UILabel *headingLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, nextLabel, 300, 16)];
                nextLabel += 25;
                headingLabel.font = [UIFont fontWithName:@"Arial" size:14.0];
                headingLabel.text = string;
                headingLabel.textAlignment = NSTextAlignmentCenter;
                [self.view addSubview:headingLabel];
            }
        } else if ([element isEqualToString:@"logo"]) {
            if (![string isEqualToString: @"\n"]) {
                anyUrlText = string;
            }
        } else if ([element isEqualToString:@"link"]) {
            if (![string isEqualToString: @"\n"]) {
                anyUrl = string;
                UIButton *logoLink = [[UIButton alloc] initWithFrame:CGRectMake(10, nextLabel, 300, 16)];
                nextLabel += 25;
                [logoLink setTitle:anyUrlText forState:UIControlStateNormal];
                [logoLink setTitleColor: [UIColor blueColor] forState: UIControlStateNormal];
                logoLink.titleLabel.font = [UIFont systemFontOfSize:14.0];
                [logoLink addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
                [self.view addSubview:logoLink];
            }
        }
    }
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        if ([element isEqualToString:@"section"]) {
            if (![string isEqualToString: @"\n"]) {
                UILabel *headingLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, nextLabel += 10, 680, 16)];
                nextLabel += 40;
                [headingLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:18.0]];
                headingLabel.text = string;
                headingLabel.textAlignment = NSTextAlignmentCenter;
                [self.view addSubview:headingLabel];
            }
        } else if ([element isEqualToString:@"info"]) {
            if (![string isEqualToString: @"\n"]) {
                UILabel *headingLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, nextLabel, 680, 16)];
                nextLabel += 40;
                headingLabel.font = [UIFont fontWithName:@"Arial" size:18.0];
                headingLabel.text = string;
                headingLabel.textAlignment = NSTextAlignmentCenter;
                [self.view addSubview:headingLabel];
            }
        } else if ([element isEqualToString:@"logo"]) {
            if (![string isEqualToString: @"\n"]) {
                anyUrlText = string;
            }
        } else if ([element isEqualToString:@"link"]) {
            if (![string isEqualToString: @"\n"]) {
                anyUrl = string;
                UIButton *logoLink = [[UIButton alloc] initWithFrame:CGRectMake(10, nextLabel, 680, 16)];
                nextLabel += 40;
                [logoLink setTitle:anyUrlText forState:UIControlStateNormal];
                [logoLink setTitleColor: [UIColor blueColor] forState: UIControlStateNormal];
                logoLink.titleLabel.font = [UIFont systemFontOfSize:18.0];
                [logoLink addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
                [self.view addSubview:logoLink];
            }
        }
    }
}

- (void)buttonPressed {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: anyUrl]];
}

@end