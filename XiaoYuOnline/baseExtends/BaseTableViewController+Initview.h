#import <UIKit/UIKit.h>
#import <XMNetworking/XMNetworking.h>
#import "BaseTableViewController.h"
#import "BaseViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "SVPullToRefresh.h"

@interface BaseTableViewController (Initview)
- (void)initInitview:(NSString *)initView;
- (void)viewDidLoadInitview:(NSString *)initView;
- (void)loadDataWithPage:(NSInteger)page isRefresh:(BOOL)isRefresh initView:(NSString *)initView;
- (void)viewWillAppear:(BOOL)animated initView:(NSString *)initView;
- (void)sendSilentRequest:(XMRequestConfigBlock)request onSuccess:(XMSuccessBlock)successBlock initView:(NSString *)initView;
- (void)didLoadDataCount:(NSInteger)count initView:(NSString *)initView;
- (void)viewDidLayoutSubviewsInitview:(NSString *)initView;
- (void)viewDidAppear:(BOOL)animated initView:(NSString *)initView;
- (void)sendRequest:(XMRequestConfigBlock)request showHUD:(BOOL)show onSuccess:(XMSuccessBlock)successBlock successHint:(NSString *)hint onFailure:(XMFailureBlock)failureBlock onFinished:(XMFinishedBlock)finishedBlcok initView:(NSString *)initView;
- (void)sendRequest:(XMRequestConfigBlock)requestBlcok onSuccess:(XMSuccessBlock)successBlock successHint:(NSString *)hint onFailure:(XMFailureBlock)failureBlock initView:(NSString *)initView;
- (void)sendRequest:(XMRequestConfigBlock)requestBlock showHUD:(BOOL)show onSuccess:(XMSuccessBlock)successBlock initView:(NSString *)initView;
- (void)sendSilentRequest:(XMRequestConfigBlock)request onSuccess:(XMSuccessBlock)successBlock onFinished:(XMFinishedBlock)finishBlcok initView:(NSString *)initView;
- (void)deallocInitview:(NSString *)initView;
- (void)didReceiveMemoryWarningInitview:(NSString *)initView;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section initView:(NSString *)initView;
- (void)preferredStatusBarStyleInitview:(NSString *)initView;
- (void)setEnablePullToRefresh:(BOOL)enablePullToRefresh initView:(NSString *)initView;

@end
