#import "BaseViewController.h"
#import "CardBagViewController.h"
#import "WKSegementSliderView.h"
#import "SVPullToRefresh.h"
#import "CardBagViewCell.h"
#import "UIView+Common.h"
#import "CardBagModel.h"

@interface CardBagViewController (Custeffet)
- (void)viewDidLoadCusteffet:(NSString *)custEffet;
- (void)contentTableViewCusteffet:(NSString *)custEffet;
- (void)viewDidLayoutSubviewsCusteffet:(NSString *)custEffet;
- (void)addPullToRefreshWithTable:(UITableView *)table list:(NSMutableArray *)list custEffet:(NSString *)custEffet;
- (void)loadTableData:(UITableView *)table list:(NSMutableArray *)list isRefresh:(BOOL)isRefresh custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView custEffet:(NSString *)custEffet;
- (void)sliderSegementBar:(WKSegementSliderView *)bar didSeletedItemAtIndex:(NSUInteger)index forward:(BOOL)isForward custEffet:(NSString *)custEffet;
- (void)didReceiveMemoryWarningCusteffet:(NSString *)custEffet;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender custEffet:(NSString *)custEffet;

@end
