#import "FBaseViewController.h"
#import "FFinanceCounterViewController.h"
#import "BRStringPickerView.h"
#import "FFinanceRepayDetailViewController.h"
#import "BRDatePickerView.h"

@interface FFinanceCounterViewController (Usdata)
- (void)viewDidLoadUsdata:(NSString *)usData;
- (void)btn_lookDetail:(UIButton *)sender usData:(NSString *)usData;
- (void)segLimitTypeChange:(UISegmentedControl *)sender usData:(NSString *)usData;
- (void)segRateTypeChange:(UISegmentedControl *)sender usData:(NSString *)usData;
- (void)countingUsdata:(NSString *)usData;
- (void)generateListDataUsdata:(NSString *)usData;
- (void)getNewDateFromString:(NSString*)formString addMonth:(NSInteger) addMonths  day:(NSInteger) days usData:(NSString *)usData;
- (void)btn_selectRepayWay:(UIButton*)sender usData:(NSString *)usData;
- (void)btnSelectDate:(UIButton *)sender usData:(NSString *)usData;
- (void)didReceiveMemoryWarningUsdata:(NSString *)usData;
- (void)textFieldDidEndEditing:( UITextField *)textField usData:(NSString *)usData;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender usData:(NSString *)usData;

@end
