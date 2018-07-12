#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import "UIViewController+ShowTextHUD.h"

@interface UIViewController (ShowTextHUDInfrate)
- (void)showHUDText:(NSString *)text infrate:(NSString *)infrate;
- (void)showHUDText:(NSString *)text description:(NSString *)desprition infrate:(NSString *)infrate;

@end
