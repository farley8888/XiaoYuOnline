#import <UIKit/UIKit.h>
#import "HomeThirdViewCell.h"
#import "ManageMoneyCell.h"

@interface HomeThirdViewCell (Custeffet)
- (void)awakeFromNibCusteffet:(NSString *)custEffet;
- (void)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier custEffet:(NSString *)custEffet;
- (void)addContrainToSubviewsCusteffet:(NSString *)custEffet;
- (void)buyButtonAction:(UIButton *)button custEffet:(NSString *)custEffet;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated custEffet:(NSString *)custEffet;

@end
