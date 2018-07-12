#import "BaseViewController.h"
#import "LoginViewController.h"
#import "RegisterController.h"
#import "WKSegementSliderView.h"
#import "PasswordLoginView.h"
#import "UIViewController+KeyboardHandler.h"
#import "UIViewController+ShowTextHUD.h"
#import "SendVerifyCodeView.h"
#import "UIView+Common.h"

@interface LoginViewController (Custeffet)
- (void)viewDidLoadCusteffet:(NSString *)custEffet;
- (void)loadSubviewsWithContentView:(UIView *)contentView custEffet:(NSString *)custEffet;
- (void)viewWillAppear:(BOOL)animated custEffet:(NSString *)custEffet;
- (void)viewWillDisappear:(BOOL)animated custEffet:(NSString *)custEffet;
- (void)viewDidLayoutSubviewsCusteffet:(NSString *)custEffet;
- (void)textFieldShouldReturn:(UITextField *)textField custEffet:(NSString *)custEffet;
- (void)sliderSegementBar:(WKSegementSliderView *)bar didSeletedItemAtIndex:(NSUInteger)index forward:(BOOL)isForward custEffet:(NSString *)custEffet;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView custEffet:(NSString *)custEffet;
- (void)createAccountButtonActionCusteffet:(NSString *)custEffet;
- (void)loginButtonAction:(UIButton *)button custEffet:(NSString *)custEffet;
- (void)tapContentScrollActionCusteffet:(NSString *)custEffet;
- (void)sendVerifyCodeButtonAction:(UIButton *)button custEffet:(NSString *)custEffet;
- (void)didReceiveMemoryWarningCusteffet:(NSString *)custEffet;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender custEffet:(NSString *)custEffet;

@end
