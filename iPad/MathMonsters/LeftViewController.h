#import <UIKit/UIKit.h>

@class Trial;
#import "TrialSelectionDelegate.h"

@interface LeftViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *trials;
@property (nonatomic, assign) id<TrialSelectionDelegate> delegate;

@end