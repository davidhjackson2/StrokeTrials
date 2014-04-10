#import "Trial.h"

@implementation Trial

+(Trial *)newTrial:(NSString *)acro title:(NSString *)title year:(NSString *)year
{
    Trial *trial = [[Trial alloc] init];
    trial.acro = acro;
    trial.title = title;
    trial.year = year;
    
    return trial;
}

@end