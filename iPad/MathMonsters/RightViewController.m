#import "RightViewController.h"
#import "Trial.h"

@implementation RightViewController

#pragma mark - View Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //Update the UI to reflect the trial set on initial load.
    [self refreshUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated, in this case the IBOutlets.
    [self setAcroLabel:nil];
    [self setTitleLabel:nil];
    [self setIconImageView:nil];
    [self setWeaponImageView:nil];
}

#pragma mark - Overridden setters
-(void)setTrial:(Trial *)trial
{
    //Make sure we're not setting up the same trial.
    if (_trial != trial) {
        _trial = trial;
        
        //Update the UI to reflect the new trial selected from the list.
        [self refreshUI];
    }
}

#pragma mark - New Methods
-(void)refreshUI
{
    _acroLabel.text = _trial.acro;
    _titleLabel.text = _trial.title;
}

#pragma mark - trial Selection Delegate
-(void)selectedTrial:(Trial *)newTrial
{
    [self setTrial:newTrial];
}

@end