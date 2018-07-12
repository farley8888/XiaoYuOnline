#import <UIKit/UIKit.h>
#import "BaseTableViewController.h"
#import "MineViewController.h"
#import "BillTableViewController.h"
#import "QAViewController.h"
#import "AboutUsViewController.h"
#import "SettingViewController.h"
#import "WellBeingViewController.h"
#import "WithdrawViewController.h"
#import "TradeRecordViewController.h"
#import "LoginViewController.h"
#import "ChargeViewController.h"
#import "MineTableHeaderView.h"
#import "AssetGraphView.h"
#import "MineTableViewCell.h"
#import "UIImage+Common.h"
#import "MineTableModel.h"

@interface MineViewController (Custeffet)
- (void)deallocCusteffet:(NSString *)custEffet;
- (void)viewDidLoadCusteffet:(NSString *)custEffet;
- (void)loadUIContentCusteffet:(NSString *)custEffet;
- (void)updateTableHeaderViewWiteAsset:(OLUserAsset *)asset custEffet:(NSString *)custEffet;
- (void)tableHeaderViewCusteffet:(NSString *)custEffet;
- (void)viewWillAppear:(BOOL)animated custEffet:(NSString *)custEffet;
- (void)viewWillDisappear:(BOOL)animated custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section custEffet:(NSString *)custEffet;
- (void)numberOfSectionsInTableView:(UITableView *)tableView custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)userDidLoginCusteffet:(NSString *)custEffet;
- (void)userDidSignOutCusteffet:(NSString *)custEffet;
- (void)userAssetChanged:(NSNotification *)notification custEffet:(NSString *)custEffet;
- (void)mineHeaderView:(MineTableHeaderView *)view buttonActionWityType:(XYMineHeaderButtonType)type custEffet:(NSString *)custEffet;
- (void)didReceiveMemoryWarningCusteffet:(NSString *)custEffet;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender custEffet:(NSString *)custEffet;

@end
