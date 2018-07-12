#import "BaseTableViewController.h"
#import "TradeDetailViewController.h"
#import "RepaymentController.h"
#import "TradeDetailViewCell.h"
#import "PhoneCodeVerifyView.h"
#import "TradeDetailModel.h"
#import "TradeRecoderModel.h"

@interface TradeDetailViewController (Custeffet)
- (void)initWithTradeModel:(TradeRecoderModel *)model custEffet:(NSString *)custEffet;
- (void)viewDidLoadCusteffet:(NSString *)custEffet;
- (void)tableHeaderViewCusteffet:(NSString *)custEffet;
- (void)tableFooterViewCusteffet:(NSString *)custEffet;
- (void)viewWillAppear:(BOOL)animated custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)commitButtonAction:(UIButton *)button custEffet:(NSString *)custEffet;
- (void)didReceiveMemoryWarningCusteffet:(NSString *)custEffet;

@end
