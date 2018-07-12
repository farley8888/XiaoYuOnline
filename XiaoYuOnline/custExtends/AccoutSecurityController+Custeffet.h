#import "BaseTableViewController.h"
#import "AccoutSecurityController.h"
#import "ChangePasswordController.h"
#import "TradePasswordController.h"
#import "GesturePasswordNextController.h"
#import "SettingTableViewCell.h"
#import "BaseInfoModel.h"

@interface AccoutSecurityController (Custeffet)
- (void)viewDidLoadCusteffet:(NSString *)custEffet;
- (void)didReceiveMemoryWarningCusteffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;

@end
