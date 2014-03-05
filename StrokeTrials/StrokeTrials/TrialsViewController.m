//
//  TrialsViewController.m
//  StrokeTrials
//
//  Created by David Jackson on 2/15/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import "Trial.h"
#import "TrialCell.h"
#import "TrialDetailsViewController.h"
#import "TrialsViewController.h"

@interface TrialsViewController ()

@end

@implementation TrialsViewController
{
    NSArray *trials;
    NSArray *searchResults;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Initialize the trials array
    Trial *trial1 = [Trial new];
    trial1.acro = @"ACTIVE-A";
    trial1.title = @"Effect of Clopidogrel Added to Aspirin in Patients with Atrial Fibrillation";
    trial1.year = @"2009";
    trial1.url = @"http://www.nejm.org/doi/pdf/10.1056/NEJMoa0901301";
    trial1.res = [NSArray arrayWithObjects:@"randomized, double-blind, multi-center, placebo controlled trial",
                  @"primary outcome of any major vascular event or death",
                  @"secondary outcome stroke",
                  @"ASA 75-100mg + clopidogrel 75mg significantly reduced risk of composite primary outcome RR 0.89 (7.6 vs 6.8% events/year)",
                  @"Also reduced risk of any stroke RR 0.72 and ischemic stroke RR 0.68 (1.9 vs 2.8% events/year)",
                  @"Hemorrhagic stroke was nonsignificantly increased",
                  @"Bleeding complications of all types, except for fatal, were all significantly increased: Major (RR 1.57, events/year 1.3->2.0%), minor (RR 2.42, 3.5->1.4%), GI (RR 1.96, 0.5->1.1%), and ICH (RR 1.87, 0.2->0.4%)",
                  @"pts controlled for CHADS2 score, duration of Afib, h/o stroke",
                  nil];
    trial1.lim = [NSArray arrayWithObjects:@"“unsuitable for coumadin” is not clearly defined and introduces potential selection bias",
                  @"13% pts had h/o stroke/tia, so can’t make recommendations specifically for primary or secondary prevention",
                  @"ARR of ischemic stroke only 0.9%, Attributable risk is 0.2% for ICH. This may sway some people to “pick their poison” opting for the minor benefit in ischemic stroke risk reduction at the cost of GI and minor bleeds",
                  nil];
    trial1.thm = @"In pts w/ Afib not suitable for warfarin, ASA + clopidogrel significantly decreases ischemic stroke risk and significantly increases minor->major bleeding risks compared to ASA monotherapy";
    
    Trial *trial2 = [Trial new];
    trial2.acro = @"ACTIVE-W";
    trial2.title = @"Clopidogrel plus aspirin versus oral anticoagulation for atrial ﬁbrillation in the Atrial ﬁbrillation Clopidogrel Trial with Irbesartan for prevention of Vascular Events";
    trial2.year = @"2006";
    trial2.url = @"http://www.ncbi.nlm.nih.gov/pubmed/16765759";
    trial2.res = [NSArray arrayWithObjects:@"randomized, open treatment w/ blinded adjucation of outcomes, controlled trial",
                  @"primary outcome of first occurrence of vascular event",
                  @"in pts w/ Afib, warfarin (annual risk 3.93%) is superior to ASA 75-100mg + clopidogrel 75mg (5.6%) for composite primary outcome",
                  @"among subgroups in the primary outcome, nondisabling strokes were significantly decreased, but disabling and fatal strokes were not",
                  @"especially in those already on oral anticoag w/ INR range 2-3.",
                  @"hemorrhagic stroke significantly increased from 0.12% to 0.36%, p=0.036",
                  @"difference in bleeding complications amongst the treatment and control groups were not significant",
                  @"the absolute difference in yearly % of hemorrghic stroke rate is less than that of ischemic stroke rate",
                  nil];
    trial2.lim = [NSArray arrayWithObjects:@"the study was stopped early because of clear benefit of warfarin over ASA + clopidogrel",
                  @"the net benefit of primary outcome versus major hemorrhage was only significantly in favor of those already on oral anticoag upon entry into the study",
                  nil];
    trial2.thm = @"Warfarin is significantly superior to ASA + clopidogrel for preventing vascular complications in pts w/ Afib (especially non-disabling strokes in those already on anticoagulation) w/ no significant increase in bleeding complications";
    
    trials = [NSArray arrayWithObjects:trial1, trial2, nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    Trial *trial = nil;
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        trial = [searchResults objectAtIndex:indexPath.row];
    } else {
        trial = [trials objectAtIndex:indexPath.row];
    }
    
    cell.acroLabel.text = trial.acro;
    cell.titleLabel.text = trial.title;
    cell.yearLabel.text = [NSString stringWithFormat:@"'%@", [trial.year substringFromIndex:2]];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showTrialDetail"]) {
        NSIndexPath *indexPath = nil;
        Trial *trial = nil;
        
        if (self.searchDisplayController.active) {
            indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            trial = [searchResults objectAtIndex:indexPath.row];
        } else {
            indexPath = [self.tableView indexPathForSelectedRow];
            trial = [trials objectAtIndex:indexPath.row];
        }
        
        TrialDetailsViewController *destViewController = segue.destinationViewController;
        destViewController.trial = trial;
    }
}

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

@end