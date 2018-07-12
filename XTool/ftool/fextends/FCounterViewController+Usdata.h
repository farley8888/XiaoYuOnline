#import "FBaseViewController.h"
#import "AJContainTableController.h"
#import "FCounterViewController.h"
#import "FHomeCell.h"
#import "FHouseCounterViewController.h"
#import "YGCTradeWindow.h"
#import "ZTAppCalculatorViewController.h"

@interface FCounterViewController (Usdata)
- (void)viewDidLoadUsdata:(NSString *)usData;
- (void)numberOfSectionsInTableView:(UITableView *)tableView usData:(NSString *)usData;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section usData:(NSString *)usData;
- (void)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section usData:(NSString *)usData;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath usData:(NSString *)usData;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath usData:(NSString *)usData;
- (void)showFloatWindowUsdata:(NSString *)usData;
- (void)didReceiveMemoryWarningUsdata:(NSString *)usData;

@end
