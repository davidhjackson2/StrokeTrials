#import "Trial.h"

@implementation Trial

-(id) init {
    self.acro = [[NSMutableString alloc] init];
    self.title = [[NSMutableString alloc] init];
    self.year = [[NSMutableString alloc] init];
    self.link = [[NSMutableString alloc] init];
    self.res = [[NSMutableArray alloc] init];
    self.lim = [[NSMutableArray alloc] init];
    self.bl = [[NSMutableString alloc] init];
    return self;
}

+(Trial *)newTrial:(NSMutableString *)acro title:(NSMutableString *)title year:(NSMutableString *)year
{
    Trial *trial = [[Trial alloc] init];
    trial.acro = acro;
    trial.title = title;
    trial.year = year;
    
    return trial;
}

@end