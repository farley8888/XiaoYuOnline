#import "QADetailViewController+Custeffet.h"
@implementation QADetailViewController (Custeffet)
- (void)initWithQAModel:(QAModel *)model custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)viewDidLoadCusteffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)didReceiveMemoryWarningCusteffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}

@end
