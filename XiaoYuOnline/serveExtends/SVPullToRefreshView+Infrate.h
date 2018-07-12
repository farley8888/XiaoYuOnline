#import <UIKit/UIKit.h>
#import <AvailabilityMacros.h>
#import <QuartzCore/QuartzCore.h>
#import "UIScrollView+SVPullToRefresh.h"
#import <objc/runtime.h>

@interface SVPullToRefreshView (Infrate)
- (void)initWithFrame:(CGRect)frame infrate:(NSString *)infrate;
- (void)willMoveToSuperview:(UIView *)newSuperview infrate:(NSString *)infrate;
- (void)layoutSubviewsInfrate:(NSString *)infrate;
- (void)setOriginalTopInset:(CGFloat)originalTopInset infrate:(NSString *)infrate;
- (void)resetScrollViewContentInsetInfrate:(NSString *)infrate;
- (void)setScrollViewContentInsetForLoadingInfrate:(NSString *)infrate;
- (void)setScrollViewContentInset:(UIEdgeInsets)contentInset infrate:(NSString *)infrate;
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context infrate:(NSString *)infrate;
- (void)scrollViewDidScroll:(CGPoint)contentOffset infrate:(NSString *)infrate;
- (void)arrowInfrate:(NSString *)infrate;
- (void)activityIndicatorViewInfrate:(NSString *)infrate;
- (void)titleLabelInfrate:(NSString *)infrate;
- (void)subtitleLabelInfrate:(NSString *)infrate;
- (void)dateLabelInfrate:(NSString *)infrate;
- (void)dateFormatterInfrate:(NSString *)infrate;
- (void)arrowColorInfrate:(NSString *)infrate;
- (void)textColorInfrate:(NSString *)infrate;
- (void)activityIndicatorViewStyleInfrate:(NSString *)infrate;
- (void)setArrowColor:(UIColor *)newArrowColor infrate:(NSString *)infrate;
- (void)setTitle:(NSString *)title forState:(SVPullToRefreshState)state infrate:(NSString *)infrate;
- (void)setSubtitle:(NSString *)subtitle forState:(SVPullToRefreshState)state infrate:(NSString *)infrate;
- (void)setCustomView:(UIView *)view forState:(SVPullToRefreshState)state infrate:(NSString *)infrate;
- (void)setTextColor:(UIColor *)newTextColor infrate:(NSString *)infrate;
- (void)setActivityIndicatorViewStyle:(UIActivityIndicatorViewStyle)viewStyle infrate:(NSString *)infrate;
- (void)setLastUpdatedDate:(NSDate *)newLastUpdatedDate infrate:(NSString *)infrate;
- (void)setDateFormatter:(NSDateFormatter *)newDateFormatter infrate:(NSString *)infrate;
- (void)triggerRefreshInfrate:(NSString *)infrate;
- (void)startAnimatingInfrate:(NSString *)infrate;
- (void)stopAnimatingInfrate:(NSString *)infrate;
- (void)setState:(SVPullToRefreshState)newState infrate:(NSString *)infrate;
- (void)rotateArrow:(float)degrees hide:(BOOL)hide infrate:(NSString *)infrate;

@end
