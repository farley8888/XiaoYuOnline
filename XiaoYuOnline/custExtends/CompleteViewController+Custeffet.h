#import "BaseViewController.h"
#import "CompleteViewController.h"

@interface CompleteViewController (Custeffet)
- (void)initWithImage:(UIImage *)image title:(NSString *)title custEffet:(NSString *)custEffet;
- (void)viewDidLoadCusteffet:(NSString *)custEffet;
- (void)competeButtonAction:(UIButton *)button custEffet:(NSString *)custEffet;
- (void)didReceiveMemoryWarningCusteffet:(NSString *)custEffet;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender custEffet:(NSString *)custEffet;

@end
