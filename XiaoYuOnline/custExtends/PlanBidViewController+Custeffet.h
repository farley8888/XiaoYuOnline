#import "BaseViewController.h"
#import "PlanBidViewController.h"
#import "UIViewController+ShowTextHUD.h"
#import "CustomTextEdgeField.h"

@interface PlanBidViewController (Custeffet)
- (void)viewDidLoadCusteffet:(NSString *)custEffet;
- (void)loadSubViewsCusteffet:(NSString *)custEffet;
- (void)planButtonAction:(UIButton *)button custEffet:(NSString *)custEffet;
- (void)dismissKeyboardActionCusteffet:(NSString *)custEffet;
- (void)didReceiveMemoryWarningCusteffet:(NSString *)custEffet;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender custEffet:(NSString *)custEffet;

@end
