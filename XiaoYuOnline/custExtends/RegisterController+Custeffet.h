#import "BaseTableViewController.h"
#import "RegisterController.h"
#import "RealNameTableViewCell.h"
#import "RegisterViewCell.h"
#import "RegisterFooterView.h"
#import "RegisterModel.h"

@interface RegisterController (Custeffet)
- (void)viewDidLoadCusteffet:(NSString *)custEffet;
- (void)addButtonActionCusteffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)textFieldValueChangedCusteffet:(NSString *)custEffet;
- (void)textFieldShouldReturn:(UITextField *)textField custEffet:(NSString *)custEffet;
- (void)loginButtonAction:(UIButton *)button custEffet:(NSString *)custEffet;
- (void)registerButtonAction:(UIButton *)button custEffet:(NSString *)custEffet;
- (void)sendVerifyCodeButtonAction:(UIButton *)button custEffet:(NSString *)custEffet;
- (void)tapContentScrollActionCusteffet:(NSString *)custEffet;
- (void)didReceiveMemoryWarningCusteffet:(NSString *)custEffet;

@end
