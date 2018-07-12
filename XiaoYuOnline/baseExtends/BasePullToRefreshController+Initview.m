#import "BasePullToRefreshController+Initview.h"
@implementation BasePullToRefreshController (Initview)
- (void)initInitview:(NSString *)initView {
    NSLog(@"%@", initView);
}
- (void)viewDidLoadInitview:(NSString *)initView {
    NSLog(@"%@", initView);
}
- (void)loadDataWithPage:(NSInteger)page isRefresh:(BOOL)isRefresh initView:(NSString *)initView {
    NSLog(@"%@", initView);
}
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section initView:(NSString *)initView {
    NSLog(@"%@", initView);
}
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath initView:(NSString *)initView {
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
- (void)didReceiveMemoryWarningInitview:(NSString *)initView {
    NSLog(@"%@", initView);
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender initView:(NSString *)initView {
    NSLog(@"%@", initView);
}

@end
