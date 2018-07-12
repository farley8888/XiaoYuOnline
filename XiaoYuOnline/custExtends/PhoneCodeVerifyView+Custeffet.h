#import <UIKit/UIKit.h>
#import "PhoneCodeVerifyView.h"
#import "CustomTextEdgeField.h"
#import "UIView+Common.h"

@interface PhoneCodeVerifyView (Custeffet)
- (void)deallocCusteffet:(NSString *)custEffet;
- (void)initWithFrame:(CGRect)frame custEffet:(NSString *)custEffet;
+ (void)phoneCodeVerifyViewCusteffet:(NSString *)custEffet;
- (void)layoutSubviewsCusteffet:(NSString *)custEffet;
- (void)showCusteffet:(NSString *)custEffet;
- (void)dismissCusteffet:(NSString *)custEffet;
- (void)sendCodeButtonActionCusteffet:(NSString *)custEffet;
- (void)commitButtonActionCusteffet:(NSString *)custEffet;
- (void)registerKeyboardNotificationCusteffet:(NSString *)custEffet;
- (void)removeKeyboardNotificationCusteffet:(NSString *)custEffet;
- (void)animationOptionsWithKeyboardNotification:(NSNotification *)noti custEffet:(NSString *)custEffet;
- (void)keyboardWillAppearHandle:(NSNotification *)noti custEffet:(NSString *)custEffet;
- (void)keyboardWillHiddenHandle:(NSNotification *)noti custEffet:(NSString *)custEffet;
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event custEffet:(NSString *)custEffet;

@end
