#import <UIKit/UIKit.h>
#import "YGCTradeWindow.h"
#import "UIView+YGCExtension.h"

@interface YGCTradeWindow (Usdata)
+ (void)loadUsdata:(NSString *)usData;
+ (void)shareWindowUsdata:(NSString *)usData;
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event usData:(NSString *)usData;
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event usData:(NSString *)usData;
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event usData:(NSString *)usData;
- (void)initUsdata:(NSString *)usData;
- (void)deallocUsdata:(NSString *)usData;
- (void)setUpNotifileUsdata:(NSString *)usData;
- (void)keyboardWillShowing:(NSNotification*)aNotification usData:(NSString *)usData;
- (void)keyboardWillHided:(NSNotification*)aNotification usData:(NSString *)usData;
- (void)longGes:(id)sender usData:(NSString *)usData;
+ (void)showWithVc:(UIViewController *)showVc usData:(NSString *)usData;
- (void)showWithVc:(UIViewController *)showVc usData:(NSString *)usData;
+ (void)isShowUsdata:(NSString *)usData;
+ (void)hideUsdata:(NSString *)usData;
- (void)hideUsdata:(NSString *)usData;
- (void)getKeyWindowUsdata:(NSString *)usData;
+ (void)getWindowHeightUsdata:(NSString *)usData;
- (void)hideNoDellocVcUsdata:(NSString *)usData;
- (void)showNoDellocVcUsdata:(NSString *)usData;
- (void)showNoDellocVcNoAnimaUsdata:(NSString *)usData;
- (void)presentFullScreenWithVc:(UIViewController *)vc usData:(NSString *)usData;
- (void)showAnimateUsdata:(NSString *)usData;
- (void)hideAnimateUsdata:(NSString *)usData;

@end
