#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "UIScrollView+SVInfiniteScrolling.h"
#import <objc/runtime.h>

@interface SVInfiniteScrollingView (Infrate)
- (void)initWithFrame:(CGRect)frame infrate:(NSString *)infrate;
- (void)willMoveToSuperview:(UIView *)newSuperview infrate:(NSString *)infrate;
- (void)layoutSubviewsInfrate:(NSString *)infrate;
- (void)resetScrollViewContentInsetInfrate:(NSString *)infrate;
- (void)setScrollViewContentInsetForInfiniteScrollingInfrate:(NSString *)infrate;
- (void)setScrollViewContentInset:(UIEdgeInsets)contentInset infrate:(NSString *)infrate;
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context infrate:(NSString *)infrate;
- (void)scrollViewDidScroll:(CGPoint)contentOffset infrate:(NSString *)infrate;
- (void)activityIndicatorViewInfrate:(NSString *)infrate;
- (void)activityIndicatorViewStyleInfrate:(NSString *)infrate;
- (void)setCustomView:(UIView *)view forState:(SVInfiniteScrollingState)state infrate:(NSString *)infrate;
- (void)setActivityIndicatorViewStyle:(UIActivityIndicatorViewStyle)viewStyle infrate:(NSString *)infrate;
- (void)triggerRefreshInfrate:(NSString *)infrate;
- (void)startAnimatingInfrate:(NSString *)infrate;
- (void)stopAnimatingInfrate:(NSString *)infrate;
- (void)setState:(SVInfiniteScrollingState)newState infrate:(NSString *)infrate;

@end
