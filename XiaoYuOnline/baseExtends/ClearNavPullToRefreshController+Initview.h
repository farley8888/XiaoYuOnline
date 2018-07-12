#import "BasePullToRefreshController.h"
#import "ClearNavPullToRefreshController.h"

@interface ClearNavPullToRefreshController (Initview)
- (void)viewDidLoadInitview:(NSString *)initView;
- (void)viewWillAppear:(BOOL)animated initView:(NSString *)initView;
- (void)viewWillDisappear:(BOOL)animated initView:(NSString *)initView;
- (void)preferredStatusBarStyleInitview:(NSString *)initView;
- (void)didReceiveMemoryWarningInitview:(NSString *)initView;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender initView:(NSString *)initView;

@end
