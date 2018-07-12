#import <UIKit/UIKit.h>
#import "UIViewController+KeyboardHandler.h"
#import <objc/objc.h>
#import <objc/runtime.h>

@interface UIViewController (KeyboardHandlerInfrate)
- (void)registerKeyboardNotificationInfrate:(NSString *)infrate;
- (void)removeKeyboardNotificationInfrate:(NSString *)infrate;
- (void)setOriginContentInset:(NSValue *)originContentInset infrate:(NSString *)infrate;
- (void)originContentInsetInfrate:(NSString *)infrate;
- (void)animationOptionsWithKeyboardNotification:(NSNotification *)noti infrate:(NSString *)infrate;
- (void)keyboardWillAppearHandle:(NSNotification *)noti infrate:(NSString *)infrate;
- (void)keyboardWillHiddenHandle:(NSNotification *)noti infrate:(NSString *)infrate;
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event infrate:(NSString *)infrate;

@end
