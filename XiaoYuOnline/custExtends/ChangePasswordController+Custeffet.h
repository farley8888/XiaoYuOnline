#import "BaseTableViewController.h"
#import "ChangePasswordController.h"
#import "UIViewController+ShowTextHUD.h"
#import "SigleTextFieldCell.h"
#import "BaseInfoModel.h"

@interface ChangePasswordController (Custeffet)
- (void)viewDidLoadCusteffet:(NSString *)custEffet;
- (void)tableFooterViewCusteffet:(NSString *)custEffet;
- (void)datasourceCusteffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)textValueDidChanged:(UITextField *)textField custEffet:(NSString *)custEffet;
- (void)commitButtonAction:(UIButton *)button custEffet:(NSString *)custEffet;
- (void)didReceiveMemoryWarningCusteffet:(NSString *)custEffet;

@end
