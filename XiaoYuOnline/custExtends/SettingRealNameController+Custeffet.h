#import "BaseTableViewController.h"
#import "SettingRealNameController.h"
#import "BindCardViewController.h"
#import "RealNameTableViewCell.h"
#import "RealNameModel.h"

@interface SettingRealNameController (Custeffet)
- (void)viewDidLoadCusteffet:(NSString *)custEffet;
- (void)tableFooterViewCusteffet:(NSString *)custEffet;
- (void)didReceiveMemoryWarningCusteffet:(NSString *)custEffet;
- (void)numberOfSectionsInTableView:(UITableView *)tableView custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)checboxButtonAction:(UIButton *)button custEffet:(NSString *)custEffet;
- (void)tapContentScrollActionCusteffet:(NSString *)custEffet;
- (void)textFieldValueChangedCusteffet:(NSString *)custEffet;
- (void)footerViewButtonAction:(UIButton *)button custEffet:(NSString *)custEffet;

@end
