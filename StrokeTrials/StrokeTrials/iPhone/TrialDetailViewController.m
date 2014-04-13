//
//  TrialDetailViewController.m
//  StrokeTrials
//
//  Created by The Mullets on 2/28/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import "TrialDetailViewController.h"
#import "TrialViewController.h"
#import "TrialWebViewController.h"
#import "SharingActivityProvider.h"

@interface TrialDetailViewController ()

@end

@implementation TrialDetailViewController

bool specLastChar = false;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.topItem.title = @"Back";
    self.title = self.trial.acro;
    self.titleLabel.text = [self.trial.title uppercaseString];
    self.yearLabel.text = self.trial.year;
    [self.trial.bl deleteCharactersInRange:NSMakeRange([self.trial.bl length]-1, 1)];
    self.blLabel.text = self.trial.bl;
    
    NSMutableString *resText = [NSMutableString string];
    for (NSString* result in self.trial.res) {
        if(specLastChar) {
            specLastChar = false;
            [resText appendFormat:@"%@\n", result];
        }
        else {
            if(![result  isEqual: @"\n"]) {
                if([result  isEqual: @"<"]) {
                    [resText length] < 1 ?[resText appendString: @"- "]:[resText deleteCharactersInRange:NSMakeRange([resText length]-1, 1)];
                    [resText appendString: @"<"];
                    specLastChar = true;
                }
                else if([result  isEqual: @">"]) {
                    [resText length] < 1 ?[resText appendString: @"- "]:[resText deleteCharactersInRange:NSMakeRange([resText length]-1, 1)];
                    [resText appendString: @">"];
                    specLastChar = true;
                }
                else if([result  isEqual: @"&"]) {
                    [resText length] < 1 ?[resText appendString: @"- "]:[resText deleteCharactersInRange:NSMakeRange([resText length]-1, 1)];
                    [resText appendString: @"&"];
                    specLastChar = true;
                }
                else if([result  isEqual: @"'"]) {
                    [resText length] < 1 ?[resText appendString: @"- "]:[resText deleteCharactersInRange:NSMakeRange([resText length]-1, 1)];
                    [resText appendString: @"'"];
                    specLastChar = true;
                }
                else if([result  isEqual: @"\""]) {
                    [resText length] < 1 ?[resText appendString: @"- "]:[resText deleteCharactersInRange:NSMakeRange([resText length]-1, 1)];
                    [resText appendString: @"\""];
                    specLastChar = true;
                }
                else {
                    [resText appendFormat:@"- %@\n", result];
                }
            }
        }
    }
    self.resLabel.text = resText;
    
    NSMutableString *limText = [NSMutableString string];
    for (NSString* limitation in self.trial.lim) {
        if(specLastChar) {
            specLastChar = false;
            [limText appendFormat:@"%@\n", limitation];
        }
        else {
            if(![limitation  isEqual: @"\n"]) {
                if([limitation  isEqual: @"<"]) {
                    [limText length] < 1 ?[limText appendString: @"- "]:[limText deleteCharactersInRange:NSMakeRange([limText length]-1, 1)];
                    [limText appendString: @"<"];
                    specLastChar = true;
                }
                else if([limitation isEqual: @">"]) {
                    [limText length] < 1 ?[limText appendString: @"- "]:[limText deleteCharactersInRange:NSMakeRange([limText length]-1, 1)];
                    [limText appendString: @">"];
                    specLastChar = true;
                }
                else if([limitation isEqual: @"&"]) {
                    [limText length] < 1 ?[limText appendString: @"- "]:[limText deleteCharactersInRange:NSMakeRange([limText length]-1, 1)];
                    [limText appendString: @"&"];
                    specLastChar = true;
                }
                else if([limitation isEqual: @"'"]) {
                    [limText length] < 1 ?[limText appendString: @"- "]:[limText deleteCharactersInRange:NSMakeRange([limText length]-1, 1)];
                    [limText appendString: @"'"];
                    specLastChar = true;
                }
                else if([limitation isEqual: @"\""]) {
                    [limText length] < 1 ?[limText appendString: @"- "]:[limText deleteCharactersInRange:NSMakeRange([limText length]-1, 1)];
                    [limText appendString: @"\""];
                    specLastChar = true;
                }
                else {
                    [limText appendFormat:@"- %@\n", limitation];
                }
            }
        }
    }
    self.limLabel.text = limText;
}

- (IBAction)share:(id)sender
{
    /*
        NSString *message = @"Check out this article I found using the free Stroke Trials app.";
        
        UIActivityViewController *VC = [[UIActivityViewController alloc]initWithActivityItems:[NSArray arrayWithObjects:message, nil] applicationActivities:nil];
        [self presentViewController:VC animated:YES completion:nil];
    */
    
    /** NSArray * applicationActivities = nil;
    //NSArray * activityItems = nil;
    //activityItems = @[[NSString stringWithFormat: @"http://apple.com"]]; //?
     
     UIActivityViewController * activityController = [[UIActivityViewController alloc] initWithActivityItems:@[@"<html><body><b>This is a bold string </b><br\\>Check out this amazing site: <a href='http://apple.com'>Apple</a></body></html>"] applicationActivities:applicationActivities];
     [activityController setValue:@"Subject Line" forKeyPath:@"subject"];
     
     
     activityController.excludedActivityTypes = @[UIActivityTypePostToWeibo, UIActivityTypePrint, UIActivityTypeCopyToPasteboard, UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll, UIActivityTypePostToTwitter, UIActivityTypeAddToReadingList];
     
     UIActivityViewController *VC = [[UIActivityViewController alloc]initWithActivityItems:[NSArray arrayWithObjects:message, nil] applicationActivities:nil];
     [self presentViewController:VC animated:YES completion:nil];
     activityController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
     
     [self presentViewController:activityController animated:YES completion:nil];**/
    
    SharingActivityProvider *sharingActivityProvider = [[SharingActivityProvider alloc] init];
    NSString *shareString = [NSString stringWithFormat:@"<html><body><br\\>Check out this article I found using the free <a href='http://apple.com'>Stroke Trials</a> iOS app.</br></br><a href='%@'>%@</br></a>%@</body></html>", self.trial.link, self.trial.acro, self.trial.title];
    NSArray *activityProviders = @[sharingActivityProvider, shareString];
    UIActivityViewController * activityController = [[UIActivityViewController alloc] initWithActivityItems:activityProviders applicationActivities:nil];
    [activityController setValue:[NSString stringWithFormat:@"%@", self.trial.acro] forKeyPath:@"subject"];
    activityController.excludedActivityTypes = @[UIActivityTypePostToWeibo, UIActivityTypePrint, UIActivityTypeCopyToPasteboard, UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll, UIActivityTypePostToTwitter, UIActivityTypeAddToReadingList, UIActivityTypeMessage, UIActivityTypePostToFacebook];
    activityController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:activityController animated:YES completion:nil];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showLink"]) {
        [[segue destinationViewController] setAcro:self.trial.acro];
        [[segue destinationViewController] setLink:self.trial.link];
    }
}

@end