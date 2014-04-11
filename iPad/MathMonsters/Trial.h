#import <Foundation/Foundation.h>

@interface Trial : NSObject

@property (nonatomic, strong) NSMutableString *acro;
@property (nonatomic, strong) NSMutableString *title;
@property (nonatomic, strong) NSMutableString *year;

//@property (nonatomic, strong) NSMutableString *acro;
//@property (nonatomic, strong) NSMutableString *title;
//@property (nonatomic, strong) NSMutableString *year;
@property (nonatomic, strong) NSMutableString *bl;
@property (nonatomic, strong) NSMutableArray *res;
@property (nonatomic, strong) NSMutableArray *lim;
@property (nonatomic, strong) NSMutableString *link;

+(Trial *)newTrial:(NSString *)acro title:(NSString *)title year:(NSString *)year;
//+(Trial *)newTrial:(NSMutableString *)acro title:(NSMutableString *)title year:(NSMutableString *)year bl:(NSMutableString *)bl res:(NSMutableArray *)res lim:(NSMutableArray *)lim link:(NSMutableString *)link;

@end