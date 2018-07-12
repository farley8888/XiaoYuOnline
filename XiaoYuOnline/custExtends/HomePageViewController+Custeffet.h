#import "ClearNavPullToRefreshController.h"
#import "HomePageViewController.h"
#import "BidDetailViewController.h"
#import "PlanBidViewController.h"
#import "InviteFrinendController.h"
#import "UIViewController+ShowTextHUD.h"
#import "LoginViewController.h"
#import "LoanViewController.h"
#import "HomeFirstViewCell.h"
#import "HomeSecondViewCell.h"
#import "HomeSectionHeader.h"
#import "HomeThirdViewCell.h"
#import <YYKit/NSDictionary+YYAdd.h>
#import "HomeSignView.h"
#import "BidModel.h"

@interface HomePageViewController (Custeffet)
- (void)initCusteffet:(NSString *)custEffet;
- (void)viewDidLoadCusteffet:(NSString *)custEffet;
- (void)loadDataWithPage:(NSInteger)page isRefresh:(BOOL)isRefresh custEffet:(NSString *)custEffet;
- (void)viewDidLayoutSubviewsCusteffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section custEffet:(NSString *)custEffet;
- (void)numberOfSectionsInTableView:(UITableView *)tableView custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)firstCell:(HomeFirstViewCell *)cell didPressedButtonWithType:(XYHomeButtonType)type custEffet:(NSString *)custEffet;
- (void)thirdCell:(HomeThirdViewCell *)cell didPressedBuyButton:(UIButton *)buyButton custEffet:(NSString *)custEffet;
- (void)homeSignView:(HomeSignView *)view didPressSignButton:(UIButton *)signButton custEffet:(NSString *)custEffet;
- (void)didReceiveMemoryWarningCusteffet:(NSString *)custEffet;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender custEffet:(NSString *)custEffet;

@end
