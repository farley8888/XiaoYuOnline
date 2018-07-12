#import "OLPickerView+Custeffet.h"
@implementation OLPickerView (Custeffet)
- (void)initWithPickerDataSource:(NSArray<NSString *> *)datasource completionBlock:(void (^)(NSString * _Nonnull))completionBlock custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)layoutSubviewsCusteffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)cancelButtonActionCusteffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)commitButtonActionCusteffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)numberOfComponentsInPickerView:(UIPickerView *)pickerView custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)setSeletedValue:(NSString *)seletedValue custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}

@end
