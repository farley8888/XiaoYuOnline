#import <UIKit/UIKit.h>
#import <AvailabilityMacros.h>
#import <QuartzCore/QuartzCore.h>
#import "UIScrollView+SVPullToRefresh.h"
#import <objc/runtime.h>

@interface UIScrollView (SVPullToRefreshInfrate)
- (void)addPullToRefreshWithActionHandler:(void (^)(void))actionHandler infrate:(NSString *)infrate;
- (void)triggerPullToRefreshInfrate:(NSString *)infrate;
- (void)setPullToRefreshView:(SVPullToRefreshView *)pullToRefreshView infrate:(NSString *)infrate;
- (void)pullToRefreshViewInfrate:(NSString *)infrate;
- (void)setShowsPullToRefresh:(BOOL)showsPullToRefresh infrate:(NSString *)infrate;
- (void)showsPullToRefreshInfrate:(NSString *)infrate;

@end
