#import <UIKit/UIKit.h>

#import "Trial.h"

#import "TrialSelectionDelegate.h"

@interface RightViewController : UIViewController <UISplitViewControllerDelegate, TrialSelectionDelegate>

@property (nonatomic, strong) Trial *trial;
@property (nonatomic, weak) IBOutlet UILabel *acroLabel;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UIImageView *iconImageView;
@property (nonatomic, weak) IBOutlet UIImageView *weaponImageView;
@property (nonatomic, weak) IBOutlet UINavigationItem *navBarItem;

@end