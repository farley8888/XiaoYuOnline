#import <UIKit/UIKit.h>
#import "ZTAppCalculatorViewController.h"
#import "CalculateMethod.h"
#import "YGCTradeWindow.h"
#import "UIView+YGCExtension.h"

@interface ZTAppCalculatorViewController (Usdata)
- (void)closeClick:(id)sender usData:(NSString *)usData;
- (void)enlargeClick:(id)sender usData:(NSString *)usData;
- (void)viewDidLoadUsdata:(NSString *)usData;
- (void)longGes:(id)sender usData:(NSString *)usData;
- (void)addBtnWithFloatWidthContainerWidth:(CGFloat)containerWidth containerHeight:(CGFloat)containerHeight btnSize:(CGFloat)fontsize usData:(NSString *)usData;
- (void)caculate:(UIButton *)sender usData:(NSString *)usData;
- (void)clickButtonsWithTag:(int)digit usData:(NSString *)usData;
- (void)processDigit:(int)digit usData:(NSString *)usData;
- (void)processOp:(int)theOp usData:(NSString *)usData;
- (void)clearUsdata:(NSString *)usData;
- (void)displayString:(NSString *)str withMethod:(NSString *)method usData:(NSString *)usData;
- (void)deallocUsdata:(NSString *)usData;

@end
