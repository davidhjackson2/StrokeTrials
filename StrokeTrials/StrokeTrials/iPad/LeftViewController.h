#import <UIKit/UIKit.h>

#import "Trial.h"
#import "TrialSelectionDelegate.h"

@interface LeftViewController : UITableViewController <NSXMLParserDelegate> {
    NSXMLParser *parser;
    NSMutableDictionary *xmlDict;
    Trial *xmlTrial;
    NSString *element;
}

@property (nonatomic, strong) NSMutableArray *trials;
@property (nonatomic, assign) id<TrialSelectionDelegate> delegate;

@end