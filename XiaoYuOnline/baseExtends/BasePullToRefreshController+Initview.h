#import "BaseViewController.h"
#import "BasePullToRefreshController.h"
#import "SVPullToRefresh.h"

@interface BasePullToRefreshController (Initview)
- (void)initInitview:(NSString *)initView;
- (void)viewDidLoadInitview:(NSString *)initView;
- (void)loadDataWithPage:(NSInteger)page isRefresh:(BOOL)isRefresh initView:(NSString *)initView;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section initView:(NSString *)initView;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath initView:(NSString *)initView;
- (void)sendSilentRequest:(XMRequestConfigBlock)request onSuccess:(XMSuccessBlock)successBlock initView:(NSString *)initView;
- (void)didLoadDataCount:(NSInteger)count initView:(NSString *)initView;
- (void)viewDidLayoutSubviewsInitview:(NSString *)initView;
- (void)viewDidAppear:(BOOL)animated initView:(NSString *)initView;
- (void)didReceiveMemoryWarningInitview:(NSString *)initView;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender initView:(NSString *)initView;

@end
