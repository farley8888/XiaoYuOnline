#import "SheetPresentStyleView.h"
#import "OLPickerView.h"
#import "UIView+Common.h"

@interface OLPickerView (Custeffet)
- (void)initWithPickerDataSource:(NSArray<NSString *> *)datasource completionBlock:(void (^)(NSString * _Nonnull))completionBlock custEffet:(NSString *)custEffet;
- (void)layoutSubviewsCusteffet:(NSString *)custEffet;
- (void)cancelButtonActionCusteffet:(NSString *)custEffet;
- (void)commitButtonActionCusteffet:(NSString *)custEffet;
- (void)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component custEffet:(NSString *)custEffet;
- (void)numberOfComponentsInPickerView:(UIPickerView *)pickerView custEffet:(NSString *)custEffet;
- (void)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component custEffet:(NSString *)custEffet;
- (void)setSeletedValue:(NSString *)seletedValue custEffet:(NSString *)custEffet;

@end
