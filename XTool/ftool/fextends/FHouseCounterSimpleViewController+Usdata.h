#import "FBaseViewController.h"
#import "AJContainTableController.h"
#import "FHouseCounterSimpleViewController.h"
#import "BaseContentCell.h"

@interface FHouseCounterSimpleViewController (Usdata)
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
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender usData:(NSString *)usData;

@end
