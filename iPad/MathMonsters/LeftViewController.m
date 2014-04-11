#import "LeftViewController.h"
#import "Trial.h"
#import "TrialCell.h"


@interface LeftViewController ()

@end

@implementation LeftViewController

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        //Initialize the array of trials for display.
        _trials = [NSMutableArray array];
        NSURL *url = [NSURL URLWithString:@"https://dl.dropboxusercontent.com/u/274948931/StrokeTrials.xml"];
        parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
        [parser setDelegate:self];
        [parser setShouldResolveExternalEntities:NO];
        [parser parse];
        
        //NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"trial.acro" ascending:YES];
        //[_trials sortUsingDescriptors:[NSArray arrayWithObject:sort]];
        
        /*
        //Create trial objects then add them to the array.
        [_trials addObject:[Trial newTrial:@"Cat-Bot" title:@"MEE-OW" year:@"meetcatbot.png"]];
        [_trials addObject:[Trial newTrial:@"Dog-Bot" title:@"BOW-WOW" year:@"meetdogbot.png"]];
        [_trials addObject:[Trial newTrial:@"Explode-Bot" title:@"Tick, tick, BOOM!" year:@"meetexplodebot.png"]];
        [_trials addObject:[Trial newTrial:@"Fire-Bot" title:@"Will Make You Steamed" year:@"meetfirebot.png"]];
        [_trials addObject:[Trial newTrial:@"Ice-Bot" title:@"Has A Chilling Effect" year:@"meeticebot.png"]];
        [_trials addObject:[Trial newTrial:@"Mini-Tomato-Bot" title:@"Extremely Handsome" year:@"meetminitomatobot.png"]];
         */
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
    static NSString *CellIdentifier = @"TrialCell";
    TrialCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    /*
    // Configure the cell...
    if (cell == nil) {
        cell = [[TrialCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    */
    
    //xmlTrial = [[_trials objectAtIndex:indexPath.row] objectForKey: @"trial"];
    
    Trial *trial = [[_trials objectAtIndex:indexPath.row] objectForKey: @"trial"];
    
    cell.acroLabel.text = trial.acro;
    cell.titleLabel.text = trial.title;
    cell.yearLabel.text = [NSString stringWithFormat:@"'%@", [trial.year substringFromIndex:2]];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Trial *selectedTrial = [[_trials objectAtIndex:indexPath.row] objectForKey: @"trial"];
    if (_delegate) {
        [_delegate selectedTrial:selectedTrial];
    }
}



- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    element = elementName;
    if ([element isEqualToString:@"trial"]) {
        xmlDict   = [[NSMutableDictionary alloc] init];
        xmlTrial  = [[Trial alloc] init];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:@"trial"]) {
        [xmlDict setObject:xmlTrial forKey:@"trial"];
        [_trials addObject:[xmlDict copy]];
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
/*
- (void)parserDidEndDocument:(NSXMLParser *)parser {
    [self.tableView reloadData];
}
*/
@end