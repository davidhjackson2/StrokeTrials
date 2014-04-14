//
//  CustomTableViewController.m
//  CustomTable
//
//  Created by Simon on 7/12/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "AntithromboticTableViewController.h"
#import "AntithromboticTableCell.h"
#import "AntithromboticDetailViewController.h"
#import "Antithrombotic.h"

@interface AntithromboticTableViewController ()

@end

@implementation AntithromboticTableViewController
{
    NSArray *Antithrombotics;
    NSArray *searchResults;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Initialize the Antithrombotics array
    Antithrombotic *Antithrombotic1 = [Antithrombotic new];
    Antithrombotic1.name = @"Apixaban";
    Antithrombotic1.lname = @"Eliquis";
    Antithrombotic1.ingredients = @"5mg bid without regard to meals. selectively and reversibly binds factor Xa. Peaks in 3-4 hours, half-life 12 hours. 87% protein-bound. Dose at 2.5mg bid if 2 of the following: age 80 or greater, weight under 60mg, or Cr 1.5 or greater.";
    
    Antithrombotic *Antithrombotic2 = [Antithrombotic new];
    Antithrombotic2.name = @"Apiximab";
    Antithrombotic2.lname = @"Reopro";
    Antithrombotic2.ingredients = @"0.25mg/kg bolus 10-60 minutes prior to procedure followed by 0.125mcg/kg/minute for up to 12 hours. Sometimes done during angioplasty or stent when co-administered with ASA. glycoprotein IIb/IIIa antagonist. this glycoprotein is found on platelets and acts as a receptor for fibrinogen, the precursor of fibrin. Monitored with PTT, goal 65-80. peaks in 30 minutes, normal hemostasis achieved in 3 days, but effects may last up to 1 week.";
    
    Antithrombotic *Antithrombotic3 = [Antithrombotic new];
    Antithrombotic3.name = @"Aspirin";
    Antithrombotic3.lname = @"ASA";
    Antithrombotic3.ingredients = @"81-325mg daily with food or full glass of water. irreversibly inhibits COX-1 and 2 via acetylation which decreases prostaglandin formation->thomboxane A2->platelet aggregation. Also has anti-inflammatory properties. People with allergies to other NSAIDs should not take ASA. Peaks in serum in 1-2 hours and half life elimination is dose dependent ranging from a few hours to 10 hours.";
    
    Antithrombotic *Antithrombotic4 = [Antithrombotic new];
    Antithrombotic4.name = @"Clopidrogel";
    Antithrombotic4.lname = @"Plavix";
    Antithrombotic4.ingredients = @"75mg daily with food. a thienopyridine inhibitor that selectively and irreversibly binds P2Y12 subtype of the ADP receptor. the ADP receptor exists on platelet membranes and allows activation of the GpIIb-IIIa complex, the major receptor for fibrinogen thereby allowing fibrin to cross link and form clots. requires CYP2C19, a liver enzyme, to convert it to its active form. loading doses of 300mg or 600mg are sometimes given to reach full therapeutic effect quickerat around 6 hours as opposed to the 5-7 days it typically takes. common side effects include GI upset and TTP";
    
    Antithrombotic *Antithrombotic5 = [Antithrombotic new];
    Antithrombotic5.name = @"Dabigatran";
    Antithrombotic5.lname = @"Pradaxa";
    Antithrombotic5.ingredients = @"150gm bid. prodrug converted to a reversible direct thrombin inhibitor. 35% protein bound. Peaks at 1 hour, 3 if taken with food. Half life around 12 hours, but up to 18 in the elderly or 28 in renal impairment. PTT, TT, and ECT are all prolonged by dabigatran. PT is prolonged by 1.5-2 times normal. Only available at 75mg or 150mg doses. Capsules should not be opened as this increases absorption by 75%. Should be taken with a full glass of water. Given at 150mg bid dosing for CrCl>30 and 75mg bid for CrCl 15-30. not recommended for CrCl <15. also need lower dose if on ketoconazole or dronedarone. Only indicated for stroke prevention in nonvalvular Afib.";
    
    Antithrombotic *Antithrombotic6 = [Antithrombotic new];
    Antithrombotic6.name = @"Dipyridamole";
    Antithrombotic6.lname = @"Aggrenox";
    Antithrombotic6.ingredients = @"200mg dipyridamole + 25mg ASA bid in the form of aggrenox. inhibits adenosine deaminase and phosphodiesterase which causes an accumulation of substances that inhibit platelet aggregation. Also may cause vasodilatation from accumulation of those mediators. >90% protein bound. Peaks in serum at about 2 hours, half life of 12 hours. Most common side effect is headache and often leads to discontinuation.";
    
    Antithrombotic *Antithrombotic7 = [Antithrombotic new];
    Antithrombotic7.name = @"Low Molecular Weight Heparin";
    Antithrombotic7.lname = @"Enoxaparin";
    Antithrombotic7.ingredients = @"1mg/kg bid. derived from heparin. has a small effect on PTT and mainly targets factor Xa. Peak effect around 4 hours and lasts 12 hours. Not protein bound. Half life is longer than heparin but independent of dose, about 4-7 hours. Monitored with factor Xa levels usually in obese or really impaired patients. LMWH is also available as dalteparin, the advantage is no renal adjustment is necessary";
    
    Antithrombotic *Antithrombotic8 = [Antithrombotic new];
    Antithrombotic8.name = @"Prasugral";
    Antithrombotic8.lname = @"Effient";
    Antithrombotic8.ingredients = @"A thienopyridine inhibitor, similar mechanism of action to plavix. Typically used for ACS, not stroke. Increased risk of bleeding in patients with unstable angina or NSTEMI. Peaks in 30 minutes, half life up to 15 hours but effects may last for over a week. Associated with TTP as a side effect.";
    
    Antithrombotic *Antithrombotic9 = [Antithrombotic new];
    Antithrombotic9.name = @"Rivaroxaban";
    Antithrombotic9.lname = @"Xeralto";
    Antithrombotic9.ingredients = @"20mg daily in the evening with meal. Selectively and reversibly binds factor Xa. 95% protein bound. peaks in 2-4 hours. Half life 5-9 hours, up to 12 in the elderly. PT and factor Xa activity may be elevated to detect it. 20mg daily for CrCl >15, should be avoided for CrCl<15. may be crushed to administer with food";
    
    Antithrombotic *Antithrombotic10 = [Antithrombotic new];
    Antithrombotic10.name = @"Ticlopidine";
    Antithrombotic10.lname = @"Ticlid";
    Antithrombotic10.ingredients = @"250mg bid with food. a thienopyridine inhibitor, similar mechanism to plavix. Associated with TTP as a side effect. Onset of action at 6 hours, peak effect at 3-5 days. Half life 12 hours";
    
    Antithrombotic *Antithrombotic11 = [Antithrombotic new];
    Antithrombotic11.name = @"Tpa";
    Antithrombotic11.lname = @"Alteplase";
    Antithrombotic11.ingredients = @"0.9mg/kg, 10% of dose over 1 minute followed by 90% over 1 hour. Binds to fibrin and converts plasminogen to plasmin. 50% of tPA is cleared at 5 minutes from infusion termination, 80% is cleared at 10 minutes. Effects may last up to an hour after infusion. Cleared by liver";
    
    Antithrombotic *Antithrombotic12 = [Antithrombotic new];
    Antithrombotic12.name = @"Unfractionated Heparin";
    Antithrombotic12.lname = @"Heparin";
    Antithrombotic12.ingredients = @"Potentiates antithrombin III which inactivates thrombin and factors IX, X, XI, XII and plasmin. Fibrinogen->fibrin is thereby inhibited. Fibrin is one of the components of clots. Acts at 20-30 minutes from administration with dose dependant half-life elimination. Absorption is erratic. Monitored by PTT or factor Xa levels. Risk of heparin induced thrombocytopenia (HIT)";
    
    Antithrombotic *Antithrombotic13 = [Antithrombotic new];
    Antithrombotic13.name = @"Warfarin";
    Antithrombotic13.lname = @"Coumadin";
    Antithrombotic13.ingredients = @"Dose varies, dosed nightly. impairs hepatic synthesis of Vit K dependant factors II, VII, IX, X, protein C, protein S by depleting functioning vitamin K. starts to work within 1-3 days and peaks in 5-7 days. It is 99% protein bound. Metabolized by CYP2C9. monitored with INR, therapeutic range is 2-3 for most indications except certain artificial heart valves and idiopathic pulmonary hypertension";
    
    Antithrombotics = [NSArray arrayWithObjects:Antithrombotic1, Antithrombotic2, Antithrombotic3, Antithrombotic4, Antithrombotic5, Antithrombotic6, Antithrombotic7, Antithrombotic8, Antithrombotic9, Antithrombotic10, Antithrombotic11, Antithrombotic12, Antithrombotic13, nil];
    
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
        return [Antithrombotics count];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 71;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomTableCell";
    AntithromboticTableCell *cell = (AntithromboticTableCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[AntithromboticTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Display Antithrombotic in the table cell
    Antithrombotic *Antithrombotic = nil;
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        Antithrombotic = [searchResults objectAtIndex:indexPath.row];
    } else {
        Antithrombotic = [Antithrombotics objectAtIndex:indexPath.row];
    }
    
    cell.nameLabel.text = Antithrombotic.name;
    cell.lnameLabel.text = Antithrombotic.lname;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showAntithromboticDetail"]) {
        NSIndexPath *indexPath = nil;
        Antithrombotic *Antithrombotic = nil;
        
        if (self.searchDisplayController.active) {
            indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            Antithrombotic = [searchResults objectAtIndex:indexPath.row];
        } else {
            indexPath = [self.tableView indexPathForSelectedRow];
            Antithrombotic = [Antithrombotics objectAtIndex:indexPath.row];
        }
        
        AntithromboticDetailViewController *destViewController = segue.destinationViewController;
        destViewController.Antithrombotic = Antithrombotic;
    }
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"name contains[c] %@", searchText];
    searchResults = [Antithrombotics filteredArrayUsingPredicate:resultPredicate];
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
