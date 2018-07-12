#import "LoanViewCell+Custeffet.h"
@implementation LoanViewCell (Custeffet)
- (void)awakeFromNibCusteffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)textFieldShouldBeginEditing:(UITextField *)textField custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)textFieldValueChanged:(UITextField *)textField custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}

@end
