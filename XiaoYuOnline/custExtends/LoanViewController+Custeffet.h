#import "BaseTableViewController.h"
#import "LoanViewController.h"
#import "LoanDescriptionCell.h"
#import "UITextView+Placeholder.h"
#import "UIViewController+ShowTextHUD.h"
#import "LoanHeaderView.h"
#import "OLPickerView.h"
#import "LoanViewCell.h"
#import "LoanModel.h"

@interface LoanViewController (Custeffet)
- (void)viewDidLoadCusteffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)didReceiveMemoryWarningCusteffet:(NSString *)custEffet;
- (void)numberOfSectionsInTableView:(UITableView *)tableView custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section custEffet:(NSString *)custEffet;
- (void)loanViewCell:(LoanViewCell *)cell textFieldShouldBeginEditing:(UITextField *)textField custEffet:(NSString *)custEffet;
- (void)loanViewCell:(LoanViewCell *)cell textFieldEditingChanged:(UITextField *)textField custEffet:(NSString *)custEffet;
- (void)loanViewCell:(LoanViewCell *)cell textViewDidEndEditing:(UITextView *)textView custEffet:(NSString *)custEffet;
- (void)checboxButtonAction:(UIButton *)button custEffet:(NSString *)custEffet;
- (void)comfirmButtonAction:(UIButton *)button custEffet:(NSString *)custEffet;

@end
