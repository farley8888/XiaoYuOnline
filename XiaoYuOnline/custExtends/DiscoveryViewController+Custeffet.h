#import "BasePullToRefreshController.h"
#import "DiscoveryViewController.h"
#import "DiscoveryDetailController.h"
#import "DiscoveryViewCell.h"
#import "SVPullToRefresh.h"
#import "DiscoveryModel.h"

@interface DiscoveryViewController (Custeffet)
- (void)viewDidLoadCusteffet:(NSString *)custEffet;
- (void)loadDataWithPage:(NSInteger)page isRefresh:(BOOL)isRefresh custEffet:(NSString *)custEffet;
- (void)didReceiveMemoryWarningCusteffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender custEffet:(NSString *)custEffet;

@end
