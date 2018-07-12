#import "BaseTableViewController.h"
#import "BidDetailViewController.h"
#import "InvestViewController.h"
#import "LoginViewController.h"
#import "BidSecondViewCell.h"
#import "BidFirstViewCell.h"
#import "BidThirdViewCell.h"
#import "BidModel.h"

@interface BidDetailViewController (Custeffet)
- (void)initWithBidModel:(BidModel *)bidModel custEffet:(NSString *)custEffet;
- (void)viewDidLoadCusteffet:(NSString *)custEffet;
- (void)didReceiveMemoryWarningCusteffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section custEffet:(NSString *)custEffet;
- (void)numberOfSectionsInTableView:(UITableView *)tableView custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)investButtonActionCusteffet:(NSString *)custEffet;

@end
