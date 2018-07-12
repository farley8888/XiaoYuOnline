#import "QAModel+Custeffet.h"
@implementation QAModel (Custeffet)
- (void)initWithTitle:(NSString *)title content:(NSString *)content custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
+ (void)QADatasourceListCusteffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}

@end
