#import "BaseTableViewController.h"
#import "TradePasswordController.h"
#import "TradePasswordNextController.h"
#import "RealNameTableViewCell.h"
#import "RealNameModel.h"

@interface TradePasswordController (Custeffet)
- (void)viewDidLoadCusteffet:(NSString *)custEffet;
- (void)tableFooterViewCusteffet:(NSString *)custEffet;
- (void)tableHeaderViewCusteffet:(NSString *)custEffet;
- (void)didReceiveMemoryWarningCusteffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)textFieldEditingChanged:(UITextField *)textField custEffet:(NSString *)custEffet;
- (void)sendVerifyCodeButtonAction:(UIButton *)button custEffet:(NSString *)custEffet;
- (void)footerOperateButtonAction:(UIButton *)button custEffet:(NSString *)custEffet;

@end
