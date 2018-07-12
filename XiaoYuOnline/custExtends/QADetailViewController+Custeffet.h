#import "BaseViewController.h"
#import "QADetailViewController.h"
#import "QAModel.h"

@interface QADetailViewController (Custeffet)
- (void)initWithQAModel:(QAModel *)model custEffet:(NSString *)custEffet;
- (void)viewDidLoadCusteffet:(NSString *)custEffet;
- (void)didReceiveMemoryWarningCusteffet:(NSString *)custEffet;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender custEffet:(NSString *)custEffet;

@end
