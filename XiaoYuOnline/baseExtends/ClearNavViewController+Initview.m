#import "ClearNavViewController+Initview.h"
@implementation ClearNavViewController (Initview)
- (void)viewDidLoadInitview:(NSString *)initView {
    NSLog(@"%@", initView);
}
- (void)viewWillAppear:(BOOL)animated initView:(NSString *)initView {
    NSLog(@"%@", initView);
}
- (void)viewWillDisappear:(BOOL)animated initView:(NSString *)initView {
    NSLog(@"%@", initView);
}
- (void)preferredStatusBarStyleInitview:(NSString *)initView {
    NSLog(@"%@", initView);
}
- (void)didReceiveMemoryWarningInitview:(NSString *)initView {
    NSLog(@"%@", initView);
}

@end
