#import "FBaseViewController.h"
#import "FSaveCounterViewController.h"
#import "BRStringPickerView.h"

@interface FSaveCounterViewController (Usdata)
- (void)viewDidLoadUsdata:(NSString *)usData;
- (void)typeChange:(id)sender usData:(NSString *)usData;
- (void)changeRateUsdata:(NSString *)usData;
- (void)selectLimit:(id)sender usData:(NSString *)usData;
- (void)counterUsdata:(NSString *)usData;
- (void)textFieldDidEndEditing:( UITextField *)textField usData:(NSString *)usData;
- (void)didReceiveMemoryWarningUsdata:(NSString *)usData;
- (void)nextItemClickUsdata:(NSString *)usData;

@end
