#import "BaseViewController.h"
#import "MutiTablesPullToRefreshController.h"

@interface MutiTablesPullToRefreshController (Initview)
- (void)viewDidLoadInitview:(NSString *)initView;
- (void)didReceiveMemoryWarningInitview:(NSString *)initView;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender initView:(NSString *)initView;

@end
