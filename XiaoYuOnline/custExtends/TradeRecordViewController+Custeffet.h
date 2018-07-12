#import "BaseViewController.h"
#import "TradeRecordViewController.h"
#import "TradeDetailViewController.h"
#import "WKSegementSliderView.h"
#import "BillTableViewCell.h"
#import "SVPullToRefresh.h"
#import "UIView+Common.h"
#import "TradeRecoderModel.h"

@interface TradeRecordViewController (Custeffet)
- (void)initCusteffet:(NSString *)custEffet;
- (void)viewDidLoadCusteffet:(NSString *)custEffet;
- (void)contentTableViewCusteffet:(NSString *)custEffet;
- (void)viewDidLayoutSubviewsCusteffet:(NSString *)custEffet;
- (void)loadUIContentCusteffet:(NSString *)custEffet;
- (void)addPullToRefreshWithTable:(UITableView *)table list:(NSMutableArray *)list custEffet:(NSString *)custEffet;
- (void)loadTableData:(UITableView *)table list:(NSMutableArray *)list isRefresh:(BOOL)isRefresh custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView custEffet:(NSString *)custEffet;
- (void)sliderSegementBar:(WKSegementSliderView *)bar didSeletedItemAtIndex:(NSUInteger)index forward:(BOOL)isForward custEffet:(NSString *)custEffet;
- (void)didReceiveMemoryWarningCusteffet:(NSString *)custEffet;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender custEffet:(NSString *)custEffet;

@end
