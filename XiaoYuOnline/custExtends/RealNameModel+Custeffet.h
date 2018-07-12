#import "BaseInfoModel.h"
#import "RealNameModel.h"

@interface RealNameModel (Custeffet)
- (void)initWithTitle:(NSString *)title content:(NSString *)content description:(NSString *)description placeHolder:(NSString *)placeHolder custEffet:(NSString *)custEffet;
+ (void)realNameDatasourceListCusteffet:(NSString *)custEffet;
+ (void)bindBankCardDatasourceListCusteffet:(NSString *)custEffet;

@end
