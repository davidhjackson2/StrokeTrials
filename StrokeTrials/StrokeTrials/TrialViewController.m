//
//  TrialViewController.m
//  StrokeTrials
//
//  Created by The Mullets on 2/15/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import "MoreViewController.h"
#import "Trial.h"
#import "TrialCell.h"
#import "TrialDetailViewController.h"
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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    trials = [[NSMutableArray alloc] init];
    NSURL *url = [NSURL URLWithString:@"https://dl.dropboxusercontent.com/u/274948931/StrokeTrials.xml"];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.topItem.title = @"Stroke Trials";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TrialCell";
    TrialCell *cell = (TrialCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[TrialCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Display trial in the table cell
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
    }/*
    if ([segue.identifier isEqualToString:@"showMore"]) {
        //MoreViewController *destViewController = segue.destinationViewController;
    }*/
}

/*
- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"name contains[c] %@", searchText];
    searchResults = [trials filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}
*/

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    element = elementName;
    if ([element isEqualToString:@"trial"]) {
        xmlTrial   = [[NSMutableDictionary alloc] init];
        trial  = [[Trial alloc] init];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:@"trial"]) {
        [xmlTrial setObject:trial forKey:@"trial"];
        [trials addObject:[xmlTrial copy]];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if ([element isEqualToString:@"acro"]) {
        [trial.acro appendString:string];
    } else if ([element isEqualToString:@"title"]) {
        [trial.title appendString:string];
    } else if ([element isEqualToString:@"link"]) {
        [trial.link appendString:string];
    } else if ([element isEqualToString:@"year"]) {
        [trial.year appendString:string];
    } else if ([element isEqualToString:@"bl"]) {
        [trial.bl appendString:string];
    } else if ([element isEqualToString:@"res"]) {
        [trial.res addObject:string];
    } else if ([element isEqualToString:@"lim"]) {
        [trial.lim addObject:string];
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    [self.tableView reloadData];
}

@end