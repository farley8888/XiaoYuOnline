#import "FBaseViewController.h"
#import "AJContainTableController.h"
#import "FHouseCounterHybirdViewController.h"
#import "BaseContentCell.h"

@interface FHouseCounterHybirdViewController (Usdata)
- (void)viewDidLoadUsdata:(NSString *)usData;
- (void)repayTypeChange:(UISegmentedControl *)sender usData:(NSString *)usData;
- (void)changeFirstTitleUsdata:(NSString *)usData;
- (void)btnCounting:(UIButton *)sender usData:(NSString *)usData;
- (void)generateListData:(double) months apieceRepay:(double)apiecePay andDecrease:(double)decrease usData:(NSString *)usData;
- (void)isInputed:(UITextField *)field andPromit:(NSString*)msg usData:(NSString *)usData;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section usData:(NSString *)usData;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath usData:(NSString *)usData;
- (void)resetHeadHight: (NSInteger) varHight usData:(NSString *)usData;
- (void)didReceiveMemoryWarningUsdata:(NSString *)usData;

@end
