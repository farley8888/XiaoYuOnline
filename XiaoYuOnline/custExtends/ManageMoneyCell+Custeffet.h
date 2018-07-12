#import <UIKit/UIKit.h>
#import "ManageMoneyCell.h"
#import "UIView+Common.h"

@interface ManageMoneyCell (Custeffet)
- (void)awakeFromNibCusteffet:(NSString *)custEffet;
- (void)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier custEffet:(NSString *)custEffet;
- (void)addConstrainsToSubviewsCusteffet:(NSString *)custEffet;
- (void)removeBottomLineViewCusteffet:(NSString *)custEffet;
- (void)buyButtonAction:(UIButton *)button custEffet:(NSString *)custEffet;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated custEffet:(NSString *)custEffet;

@end
