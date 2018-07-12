#import "BaseNavigationController+Initview.h"
@implementation BaseNavigationController (Initview)
- (void)viewDidLoadInitview:(NSString *)initView {
    NSLog(@"%@", initView);
}
- (void)preferredStatusBarStyleInitview:(NSString *)initView {
    NSLog(@"%@", initView);
}
- (void)didReceiveMemoryWarningInitview:(NSString *)initView {
    NSLog(@"%@", initView);
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender initView:(NSString *)initView {
    NSLog(@"%@", initView);
}

@end
