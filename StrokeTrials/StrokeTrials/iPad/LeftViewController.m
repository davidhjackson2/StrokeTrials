//
//  LeftViewController.m
//  StrokeTrials
//
//  Created by The Mullets on 4/11/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import "LeftViewController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController
{
    NSArray *searchResults;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        self.trials = [NSMutableArray array];
        NSURL *url = [NSURL URLWithString:@"https://dl.dropboxusercontent.com/u/274948931/StrokeTrials.xml"];
        parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
        [parser setDelegate:self];
        [parser setShouldResolveExternalEntities:NO];
        [parser parse];
        
        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"trial.acro" ascending:YES];
        [self.trials sortUsingDescriptors:[NSArray arrayWithObject:sort]];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.topItem.title = @"Stroke Trials";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
        
    } else {
        return [self.trials count];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Trial *trial;
    static NSString *CellIdentifier = @"TrialCell";
    TrialCell *cell = (TrialCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[TrialCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        trial = [[searchResults objectAtIndex:indexPath.row] objectForKey: @"trial"];
    } else {
        trial = [[self.trials objectAtIndex:indexPath.row] objectForKey: @"trial"];
    }
    
    cell.acroLabel.text = trial.acro;
    cell.titleLabel.text = trial.title;
    cell.yearLabel.text = [NSString stringWithFormat:@"'%@", [trial.year substringFromIndex:2]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Trial *selectedTrial;
    
    if (self.searchDisplayController.active) {
        indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
        selectedTrial = [[searchResults objectAtIndex:indexPath.row] objectForKey: @"trial"];
    } else {
        indexPath = [self.tableView indexPathForSelectedRow];
        selectedTrial = [[self.trials objectAtIndex:indexPath.row] objectForKey: @"trial"];
    }
    
    if (self.delegate) {
        [self.delegate selectedTrial:selectedTrial];
    }
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"(trial.title contains[c] %@) || (trial.acro contains[c] %@) || (trial.year contains[c] %@)", searchText, searchText, searchText];
    searchResults = [self.trials filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    element = elementName;
    if ([element isEqualToString:@"trial"]) {
        xmlDict = [[NSMutableDictionary alloc] init];
        xmlTrial = [[Trial alloc] init];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:@"trial"]) {
        [xmlDict setObject:xmlTrial forKey:@"trial"];
        [self.trials addObject:[xmlDict copy]];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if ([element isEqualToString:@"acro"]) {
        [xmlTrial.acro appendString:string];
    } else if ([element isEqualToString:@"title"]) {
        [xmlTrial.title appendString:string];
    } else if ([element isEqualToString:@"link"]) {
        [xmlTrial.link appendString:string];
    } else if ([element isEqualToString:@"year"]) {
        [xmlTrial.year appendString:string];
    } else if ([element isEqualToString:@"bl"]) {
        [xmlTrial.bl appendString:string];
    } else if ([element isEqualToString:@"res"]) {
        [xmlTrial.res addObject:string];
    } else if ([element isEqualToString:@"lim"]) {
        [xmlTrial.lim addObject:string];
    }
}

@end