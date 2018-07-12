#import "FBaseViewController.h"
#import "AJContainTableController.h"
#import "FFinanceRepayDetailViewController.h"
#import "FRepayDetailCell.h"

@interface FFinanceRepayDetailViewController (Usdata)
- (void)viewDidLoadUsdata:(NSString *)usData;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section usData:(NSString *)usData;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath usData:(NSString *)usData;
- (void)didReceiveMemoryWarningUsdata:(NSString *)usData;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender usData:(NSString *)usData;

@end
