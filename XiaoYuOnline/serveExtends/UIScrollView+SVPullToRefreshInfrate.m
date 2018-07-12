#import "UIScrollView+SVPullToRefreshInfrate.h"
@implementation UIScrollView (SVPullToRefreshInfrate)
- (void)addPullToRefreshWithActionHandler:(void (^)(void))actionHandler infrate:(NSString *)infrate {
    NSLog(@"%@", infrate);
}
- (void)triggerPullToRefreshInfrate:(NSString *)infrate {
    NSLog(@"%@", infrate);
}
- (void)setPullToRefreshView:(SVPullToRefreshView *)pullToRefreshView infrate:(NSString *)infrate {
    NSLog(@"%@", infrate);
}
- (void)pullToRefreshViewInfrate:(NSString *)infrate {
    NSLog(@"%@", infrate);
}
- (void)setShowsPullToRefresh:(BOOL)showsPullToRefresh infrate:(NSString *)infrate {
    NSLog(@"%@", infrate);
}
- (void)showsPullToRefreshInfrate:(NSString *)infrate {
    NSLog(@"%@", infrate);
}

@end
