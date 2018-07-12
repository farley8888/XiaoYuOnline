#import "BaseViewController+Initview.h"
@implementation BaseViewController (Initview)
- (void)viewDidLoadInitview:(NSString *)initView {
    NSLog(@"%@", initView);
}
- (void)viewWillAppear:(BOOL)animated initView:(NSString *)initView {
    NSLog(@"%@", initView);
}
- (void)preferredStatusBarStyleInitview:(NSString *)initView {
    NSLog(@"%@", initView);
}
+ (void)defaultNavigationBarImageInitview:(NSString *)initView {
    NSLog(@"%@", initView);
}
+ (void)defaultNavigationBarShadowImageInitview:(NSString *)initView {
    NSLog(@"%@", initView);
}
- (void)sendRequest:(XMRequestConfigBlock)request showHUD:(BOOL)show onSuccess:(XMSuccessBlock)successBlock successHint:(NSString *)hint onFailure:(XMFailureBlock)failureBlock onFinished:(XMFinishedBlock)finishedBlcok initView:(NSString *)initView {
    NSLog(@"%@", initView);
}
- (void)sendRequest:(XMRequestConfigBlock)requestBlcok onSuccess:(XMSuccessBlock)successBlock successHint:(NSString *)hint onFailure:(XMFailureBlock)failureBlock initView:(NSString *)initView {
    NSLog(@"%@", initView);
}
- (void)sendRequest:(XMRequestConfigBlock)requestBlock showHUD:(BOOL)show onSuccess:(XMSuccessBlock)successBlock initView:(NSString *)initView {
    NSLog(@"%@", initView);
}
- (void)sendSilentRequest:(XMRequestConfigBlock)request onSuccess:(XMSuccessBlock)successBlock onFinished:(XMFinishedBlock)finishBlcok initView:(NSString *)initView {
    NSLog(@"%@", initView);
}
- (void)deallocInitview:(NSString *)initView {
    NSLog(@"%@", initView);
}
- (void)didReceiveMemoryWarningInitview:(NSString *)initView {
    NSLog(@"%@", initView);
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender initView:(NSString *)initView {
    NSLog(@"%@", initView);
}

@end
