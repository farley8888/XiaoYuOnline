#import "BaseViewController.h"
#import "ClearNavViewController.h"

@interface ClearNavViewController (Initview)
- (void)viewDidLoadInitview:(NSString *)initView;
- (void)viewWillAppear:(BOOL)animated initView:(NSString *)initView;
- (void)viewWillDisappear:(BOOL)animated initView:(NSString *)initView;
- (void)preferredStatusBarStyleInitview:(NSString *)initView;
- (void)didReceiveMemoryWarningInitview:(NSString *)initView;

@end
