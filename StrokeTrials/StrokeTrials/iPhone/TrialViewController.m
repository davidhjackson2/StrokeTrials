//
//  TrialViewController.m
//  StrokeTrials
//
//  Created by The Mullets on 2/15/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import "TrialViewController.h"

@interface TrialViewController ()

@end

@implementation TrialViewController
{
    NSMutableArray *trials;
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
    trials = [[NSMutableArray alloc] init];
    NSURL *url = [NSURL URLWithString:@"https://sites.google.com/site/stroketrialsapp/home/manager/StrokeTrials.xml"];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"trial.acro" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)];
    [trials sortUsingDescriptors:[NSArray arrayWithObject:sort]];
}

-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.topItem.title = @"Stroke Trials";
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
        return [trials count];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
        trial = [[trials objectAtIndex:indexPath.row] objectForKey: @"trial"];
    }
    
    cell.acroLabel.text = trial.acro;
    cell.titleLabel.text = trial.title;
    cell.yearLabel.text = [NSString stringWithFormat:@"'%@", [trial.year substringFromIndex:2]];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showTrialDetail"]) {
        NSIndexPath *indexPath = nil;
        
        if (self.searchDisplayController.active) {
            indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            [[segue destinationViewController] setTrial:[[searchResults objectAtIndex:indexPath.row] objectForKey: @"trial"]];
        } else {
            indexPath = [self.tableView indexPathForSelectedRow];
            [[segue destinationViewController] setTrial:[trials[indexPath.row] objectForKey: @"trial"]];
        }
    }
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSArray *HalfSearchResults;
    NSMutableArray *AlmostThere;
    NSArray *query = [searchText componentsSeparatedByString:@" "];
    NSPredicate *resultTitlePredicate;
    NSPredicate *resultAcroPredicate;
    NSPredicate *resultYearPredicate;
    NSPredicate *resultTagsPredicate;
    for (int i = 0; i < query.count; i++) {
        resultTitlePredicate = [NSPredicate predicateWithFormat:@"trial.title contains[c] %@", query[i]];
        resultAcroPredicate = [NSPredicate predicateWithFormat:@"trial.acro contains[c] %@", query[i]];
        resultYearPredicate = [NSPredicate predicateWithFormat:@"trial.year contains[c] %@", query[i]];
        resultTagsPredicate = [NSPredicate predicateWithFormat:@"trial.tags contains[c] %@", query[i]];
        NSPredicate *resultPredicate = [NSCompoundPredicate orPredicateWithSubpredicates: @[resultTitlePredicate, resultAcroPredicate, resultYearPredicate, resultTagsPredicate]];
        HalfSearchResults = [trials filteredArrayUsingPredicate:resultPredicate];
        [AlmostThere addObjectsFromArray:HalfSearchResults];
    }
    [searchResults arrayByAddingObjectsFromArray:AlmostThere];
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
        [trials addObject:[xmlDict copy]];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if ([element isEqualToString:@"acro"]) {
        [xmlTrial.acro appendString:string];
    } else if ([element isEqualToString:@"title"]) {
        [xmlTrial.title appendString:string];
    } else if ([element isEqualToString:@"journal"]) {
        [xmlTrial.journal appendString:string];
    } else if ([element isEqualToString:@"year"]) {
        [xmlTrial.year appendString:string];
    } else if ([element isEqualToString:@"bl"]) {
        [xmlTrial.bl appendString:string];
    } else if ([element isEqualToString:@"res"]) {
        [xmlTrial.res addObject:string];
    } else if ([element isEqualToString:@"lim"]) {
        [xmlTrial.lim addObject:string];
    } else if ([element isEqualToString:@"link"]) {
        [xmlTrial.link appendString:string];
    } else if ([element isEqualToString:@"tag"]) {
        [xmlTrial.tags appendString:string];
    }
}

@end