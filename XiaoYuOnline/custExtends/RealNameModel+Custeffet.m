#import "RealNameModel+Custeffet.h"
@implementation RealNameModel (Custeffet)
- (void)initWithTitle:(NSString *)title content:(NSString *)content description:(NSString *)description placeHolder:(NSString *)placeHolder custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
+ (void)realNameDatasourceListCusteffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
+ (void)bindBankCardDatasourceListCusteffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}

@end
