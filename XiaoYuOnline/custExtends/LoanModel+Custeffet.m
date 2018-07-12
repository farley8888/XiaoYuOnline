#import "LoanModel+Custeffet.h"
@implementation LoanModel (Custeffet)
- (void)initWithTitle:(NSString *)title content:(NSString *)content description:(NSString *)description placeHolder:(NSString *)placeHolder custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
+ (void)loanDatasourceListCusteffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}

@end
