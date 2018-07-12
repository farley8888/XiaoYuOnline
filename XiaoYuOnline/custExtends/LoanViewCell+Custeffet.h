#import <UIKit/UIKit.h>
#import "LoanViewCell.h"

@interface LoanViewCell (Custeffet)
- (void)awakeFromNibCusteffet:(NSString *)custEffet;
- (void)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier custEffet:(NSString *)custEffet;
- (void)textFieldShouldBeginEditing:(UITextField *)textField custEffet:(NSString *)custEffet;
- (void)textFieldValueChanged:(UITextField *)textField custEffet:(NSString *)custEffet;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated custEffet:(NSString *)custEffet;

@end
