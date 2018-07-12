#import "BaseTableViewController+Initview.h"
@implementation BaseTableViewController (Initview)
- (void)initInitview:(NSString *)initView {
    NSLog(@"%@", initView);
}
- (void)viewDidLoadInitview:(NSString *)initView {
    NSLog(@"%@", initView);
}
- (void)loadDataWithPage:(NSInteger)page isRefresh:(BOOL)isRefresh initView:(NSString *)initView {
    NSLog(@"%@", initView);
}
- (void)viewWillAppear:(BOOL)animated initView:(NSString *)initView {
    NSLog(@"%@", initView);
}
- (void)sendSilentRequest:(XMRequestConfigBlock)request onSuccess:(XMSuccessBlock)successBlock initView:(NSString *)initView {
    NSLog(@"%@", initView);
}
- (void)didLoadDataCount:(NSInteger)count initView:(NSString *)initView {
    NSLog(@"%@", initView);
}
- (void)viewDidLayoutSubviewsInitview:(NSString *)initView {
    NSLog(@"%@", initView);
}
- (void)viewDidAppear:(BOOL)animated initView:(NSString *)initView {
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
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section initView:(NSString *)initView {
    NSLog(@"%@", initView);
}
- (void)preferredStatusBarStyleInitview:(NSString *)initView {
    NSLog(@"%@", initView);
}
- (void)setEnablePullToRefresh:(BOOL)enablePullToRefresh initView:(NSString *)initView {
    NSLog(@"%@", initView);
}

@end
