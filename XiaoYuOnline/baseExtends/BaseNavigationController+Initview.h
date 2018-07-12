#import <UIKit/UIKit.h>
#import "BaseNavigationController.h"

@interface BaseNavigationController (Initview)
- (void)viewDidLoadInitview:(NSString *)initView;
- (void)preferredStatusBarStyleInitview:(NSString *)initView;
- (void)didReceiveMemoryWarningInitview:(NSString *)initView;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender initView:(NSString *)initView;

@end
