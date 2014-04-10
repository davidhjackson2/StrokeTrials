#import "LeftViewController.h"
#import "Trial.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        //Initialize the array of trials for display.
        _trials = [NSMutableArray array];
        
        //Create trial objects then add them to the array.
        [_trials addObject:[Trial newTrial:@"Cat-Bot" title:@"MEE-OW" year:@"meetcatbot.png"]];
        [_trials addObject:[Trial newTrial:@"Dog-Bot" title:@"BOW-WOW" year:@"meetdogbot.png"]];
        [_trials addObject:[Trial newTrial:@"Explode-Bot" title:@"Tick, tick, BOOM!" year:@"meetexplodebot.png"]];
        [_trials addObject:[Trial newTrial:@"Fire-Bot" title:@"Will Make You Steamed" year:@"meetfirebot.png"]];
        [_trials addObject:[Trial newTrial:@"Ice-Bot" title:@"Has A Chilling Effect" year:@"meeticebot.png"]];
        [_trials addObject:[Trial newTrial:@"Mini-Tomato-Bot" title:@"Extremely Handsome" year:@"meetminitomatobot.png"]];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_trials count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Trial *trial = _trials[indexPath.row];
    cell.textLabel.text = trial.acro;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Trial *selectedTrial = [_trials objectAtIndex:indexPath.row];
    if (_delegate) {
        [_delegate selectedTrial:selectedTrial];
    }
}

@end