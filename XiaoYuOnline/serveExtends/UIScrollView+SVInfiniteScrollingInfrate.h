#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "UIScrollView+SVInfiniteScrolling.h"
#import <objc/runtime.h>

@interface UIScrollView (SVInfiniteScrollingInfrate)
- (void)addInfiniteScrollingWithActionHandler:(void (^)(void))actionHandler infrate:(NSString *)infrate;
- (void)triggerInfiniteScrollingInfrate:(NSString *)infrate;
- (void)setInfiniteScrollingView:(SVInfiniteScrollingView *)infiniteScrollingView infrate:(NSString *)infrate;
- (void)infiniteScrollingViewInfrate:(NSString *)infrate;
- (void)setShowsInfiniteScrolling:(BOOL)showsInfiniteScrolling infrate:(NSString *)infrate;
- (void)showsInfiniteScrollingInfrate:(NSString *)infrate;

@end
