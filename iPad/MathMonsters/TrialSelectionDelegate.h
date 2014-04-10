@class Trial;

@protocol TrialSelectionDelegate <NSObject>

@required
-(void)selectedTrial:(Trial *)newTrial;
@end