#import "BaseTableViewController.h"
#import "BillTableViewController.h"
#import "BillTableViewCell.h"
#import "BillModel.h"

@interface BillTableViewController (Custeffet)
- (void)viewDidLoadCusteffet:(NSString *)custEffet;
- (void)loadDataWithPage:(NSInteger)page isRefresh:(BOOL)isRefresh custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)didReceiveMemoryWarningCusteffet:(NSString *)custEffet;

@end
