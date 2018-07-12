#import "BaseTableViewController.h"
#import "ShippingAddressController.h"
#import "BaseInfoModel.h"
#import "RealNameTableViewCell.h"

@interface ShippingAddressController (Custeffet)
- (void)viewDidLoadCusteffet:(NSString *)custEffet;
- (void)tableHeaderViewCusteffet:(NSString *)custEffet;
- (void)tableFooterViewCusteffet:(NSString *)custEffet;
- (void)didReceiveMemoryWarningCusteffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;

@end
