#import "FFinanceRepayDetailViewController+Usdata.h"
@implementation FFinanceRepayDetailViewController (Usdata)
- (void)viewDidLoadUsdata:(NSString *)usData {
    NSLog(@"%@", usData);
}
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section usData:(NSString *)usData {
    NSLog(@"%@", usData);
}
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath usData:(NSString *)usData {
    NSLog(@"%@", usData);
}
- (void)didReceiveMemoryWarningUsdata:(NSString *)usData {
    NSLog(@"%@", usData);
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender usData:(NSString *)usData {
    NSLog(@"%@", usData);
}

@end
