#import "FCounterViewController+Usdata.h"
@implementation FCounterViewController (Usdata)
- (void)viewDidLoadUsdata:(NSString *)usData {
    NSLog(@"%@", usData);
}
- (void)numberOfSectionsInTableView:(UITableView *)tableView usData:(NSString *)usData {
    NSLog(@"%@", usData);
}
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section usData:(NSString *)usData {
    NSLog(@"%@", usData);
}
- (void)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section usData:(NSString *)usData {
    NSLog(@"%@", usData);
}
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath usData:(NSString *)usData {
    NSLog(@"%@", usData);
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath usData:(NSString *)usData {
    NSLog(@"%@", usData);
}
- (void)showFloatWindowUsdata:(NSString *)usData {
    NSLog(@"%@", usData);
}
- (void)didReceiveMemoryWarningUsdata:(NSString *)usData {
    NSLog(@"%@", usData);
}

@end
