#import "BaseInfoModel.h"
#import "LoanModel.h"

@interface LoanModel (Custeffet)
- (void)initWithTitle:(NSString *)title content:(NSString *)content description:(NSString *)description placeHolder:(NSString *)placeHolder custEffet:(NSString *)custEffet;
+ (void)loanDatasourceListCusteffet:(NSString *)custEffet;

@end
