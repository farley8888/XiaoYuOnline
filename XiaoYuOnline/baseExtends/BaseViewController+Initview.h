#import <UIKit/UIKit.h>
#import <XMNetworking/XMNetworking.h>
#import "BaseViewController.h"
#import "UIImage+Common.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface BaseViewController (Initview)
- (void)viewDidLoadInitview:(NSString *)initView;
- (void)viewWillAppear:(BOOL)animated initView:(NSString *)initView;
- (void)preferredStatusBarStyleInitview:(NSString *)initView;
+ (void)defaultNavigationBarImageInitview:(NSString *)initView;
+ (void)defaultNavigationBarShadowImageInitview:(NSString *)initView;
- (void)sendRequest:(XMRequestConfigBlock)request showHUD:(BOOL)show onSuccess:(XMSuccessBlock)successBlock successHint:(NSString *)hint onFailure:(XMFailureBlock)failureBlock onFinished:(XMFinishedBlock)finishedBlcok initView:(NSString *)initView;
- (void)sendRequest:(XMRequestConfigBlock)requestBlcok onSuccess:(XMSuccessBlock)successBlock successHint:(NSString *)hint onFailure:(XMFailureBlock)failureBlock initView:(NSString *)initView;
- (void)sendRequest:(XMRequestConfigBlock)requestBlock showHUD:(BOOL)show onSuccess:(XMSuccessBlock)successBlock initView:(NSString *)initView;
- (void)sendSilentRequest:(XMRequestConfigBlock)request onSuccess:(XMSuccessBlock)successBlock onFinished:(XMFinishedBlock)finishBlcok initView:(NSString *)initView;
- (void)deallocInitview:(NSString *)initView;
- (void)didReceiveMemoryWarningInitview:(NSString *)initView;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender initView:(NSString *)initView;

@end
