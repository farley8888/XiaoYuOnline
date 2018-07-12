#import "MutiTablesPullToRefreshController+Initview.h"
@implementation MutiTablesPullToRefreshController (Initview)
- (void)viewDidLoadInitview:(NSString *)initView {
    NSLog(@"%@", initView);
}
- (void)didReceiveMemoryWarningInitview:(NSString *)initView {
    NSLog(@"%@", initView);
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender initView:(NSString *)initView {
    NSLog(@"%@", initView);
}

@end
