#import "BillTableViewController+Custeffet.h"
@implementation BillTableViewController (Custeffet)
- (void)viewDidLoadCusteffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)loadDataWithPage:(NSInteger)page isRefresh:(BOOL)isRefresh custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)didReceiveMemoryWarningCusteffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}

@end