//
//  AntithromboticViewController.m
//  StrokeTrials
//
//  Created by The Mullets on 4/16/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import "AntithromboticViewController.h"

@interface AntithromboticViewController ()

@end

@implementation AntithromboticViewController
{
    NSMutableArray *antithrombotics;
    NSArray *searchResults;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    if (networkStatus == NotReachable) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Network Error" message:@"The Internet connection appears to be offline." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
    [super viewDidLoad];
    antithrombotics = [[NSMutableArray alloc] init];
    NSURL *url = [NSURL URLWithString:@"https://dl.dropboxusercontent.com/u/274948931/Antithrombotics.xml"];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"antithrombotic.name" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)];
    [antithrombotics sortUsingDescriptors:[NSArray arrayWithObject:sort]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
        
    } else {
        return [antithrombotics count];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Antithrombotic *antithrombotic;
    static NSString *CellIdentifier = @"AntithromboticCell";
    AntithromboticCell *cell = (AntithromboticCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[AntithromboticCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        antithrombotic = [[searchResults objectAtIndex:indexPath.row] objectForKey: @"antithrombotic"];
    } else {
        antithrombotic = [[antithrombotics objectAtIndex:indexPath.row] objectForKey: @"antithrombotic"];
    }
    
    cell.nameLabel.text = antithrombotic.name;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showAntithromboticDetail"]) {
        NSIndexPath *indexPath = nil;
        
        if (self.searchDisplayController.active) {
            indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            [[segue destinationViewController] setAntithrombotic:[[searchResults objectAtIndex:indexPath.row] objectForKey: @"antithrombotic"]];
        } else {
            indexPath = [self.tableView indexPathForSelectedRow];
            [[segue destinationViewController] setAntithrombotic:[antithrombotics[indexPath.row] objectForKey: @"antithrombotic"]];
       }
    }
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"antithrombotic.name contains[c] %@", searchText];
    searchResults = [antithrombotics filteredArrayUsingPredicate:resultPredicate];
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
    if ([element isEqualToString:@"antithrombotic"]) {
        xmlDict = [[NSMutableDictionary alloc] init];
        xmlAntithrombotic = [[Antithrombotic alloc] init];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:@"antithrombotic"]) {
        [xmlDict setObject:xmlAntithrombotic forKey:@"antithrombotic"];
        [antithrombotics addObject:[xmlDict copy]];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if ([element isEqualToString:@"name"]) {
        [xmlAntithrombotic.name appendString:string];
    } else if ([element isEqualToString:@"content"]) {
        [xmlAntithrombotic.content appendString:string];
    }
}

-(void)pullFromNet {
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    if (networkStatus == NotReachable) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Network Error" message:@"The Internet connection appears to be offline." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    } else {
        NSURL *url = [NSURL URLWithString:@"https://dl.dropboxusercontent.com/u/274948931/StrokeTrials.xml"];
        parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
        [parser setDelegate:self];
        [parser setShouldResolveExternalEntities:NO];
        [parser parse];
        [self performSelector:@selector(updateTable) withObject:nil afterDelay:1];
    }
}

- (void)updateTable {
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
}

@end