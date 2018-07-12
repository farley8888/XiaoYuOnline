#import "BaseTableViewController.h"
#import "SettingViewController.h"
#import "SettingTableViewCell.h"
#import "SettingRealNameController.h"
#import "ShippingAddressController.h"
#import "AccoutSecurityController.h"
#import "BindCardViewController.h"
#import "SettingModel.h"

@interface SettingViewController (Custeffet)
- (void)deallocCusteffet:(NSString *)custEffet;
- (void)viewDidLoadCusteffet:(NSString *)custEffet;
- (void)tableFooterViewCusteffet:(NSString *)custEffet;
- (void)didReceiveMemoryWarningCusteffet:(NSString *)custEffet;
- (void)numberOfSectionsInTableView:(UITableView *)tableView custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)userInfoChangeActionCusteffet:(NSString *)custEffet;
- (void)safeSignOutAction:(UIButton *)button custEffet:(NSString *)custEffet;

@end
