#import "BaseViewController.h"
#import "InvestViewController.h"
#import "UIViewController+ShowTextHUD.h"
#import "UIView+Common.h"
#import "PreferentialModel.h"

@interface InvestViewController (Custeffet)
- (void)initWithBidId:(NSString *)bidId custEffet:(NSString *)custEffet;
- (void)viewDidLoadCusteffet:(NSString *)custEffet;
- (void)loadSubviewsWithContentView:(UIView *)contentView custEffet:(NSString *)custEffet;
- (void)loadPreferentialViewsCusteffet:(NSString *)custEffet;
- (void)layoutSubviewsInContentView:(UIView *)contentView custEffet:(NSString *)custEffet;
- (void)viewDidAppear:(BOOL)animated custEffet:(NSString *)custEffet;
- (void)useButtonAction:(UIButton *)button custEffet:(NSString *)custEffet;
- (void)previousButtonActionCusteffet:(NSString *)custEffet;
- (void)nextButtonActionCusteffet:(NSString *)custEffet;
- (void)inputValueChangedCusteffet:(NSString *)custEffet;
- (void)selectTicketButtonAction:(UIButton *)button custEffet:(NSString *)custEffet;
- (void)investButtonAction:(UIButton *)button custEffet:(NSString *)custEffet;
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event custEffet:(NSString *)custEffet;
- (void)didReceiveMemoryWarningCusteffet:(NSString *)custEffet;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender custEffet:(NSString *)custEffet;

@end
