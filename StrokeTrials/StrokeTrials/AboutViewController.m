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
    // Do any additional setup after loading the view.
    NSURL *url = [NSURL URLWithString:@"https://sites.google.com/site/stroketrialsapp/home/manager/About.xml"];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    element = elementName;
    if ([element isEqualToString:@"about"]) {
        xmlDict = [[NSMutableDictionary alloc] init];
        //xmlTrial = [[Trial alloc] init];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:@"about"]) {
        //[xmlDict setObject:xmlTrial forKey:@"trial"];
        //[self.trials addObject:[xmlDict copy]];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if ([element isEqualToString:@"section"]) {
        if (![string isEqualToString: @"\n"]) {
            UILabel *headingLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, nextLabel+=5, 300, 17)];
            nextLabel+=22;
            [headingLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:16.0]];
            headingLabel.text = string;
            headingLabel.textAlignment = NSTextAlignmentCenter;
            [self.view addSubview:headingLabel];
        }
    } else if ([element isEqualToString:@"info"]) {
        if (![string isEqualToString: @"\n"]) {
            UILabel *headingLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, nextLabel, 300, 16)];
            nextLabel+=21;
            headingLabel.font = [UIFont fontWithName:@"Arial" size:15.0];
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
            nextLabel+=21;
            [logoLink setTitle:anyUrlText forState:UIControlStateNormal];
            [logoLink setTitleColor: [UIColor blueColor] forState: UIControlStateNormal];
            [logoLink addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:logoLink];
        }
    }
}

- (void)buttonPressed{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: anyUrl]];
}

@end