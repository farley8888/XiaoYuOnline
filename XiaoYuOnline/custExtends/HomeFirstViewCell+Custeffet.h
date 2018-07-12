#import <UIKit/UIKit.h>
#import "HomeFirstViewCell.h"
#import "TTVerticalAlignmentButton.h"
#import <SDCycleScrollView/SDCycleScrollView.h>

@interface HomeFirstViewCell (Custeffet)
- (void)awakeFromNibCusteffet:(NSString *)custEffet;
- (void)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier custEffet:(NSString *)custEffet;
- (void)layoutSubviewsCusteffet:(NSString *)custEffet;
- (void)subButtonWithTitle:(NSString *)title image:(UIImage *)image custEffet:(NSString *)custEffet;
- (void)operateButtonAction:(UIButton *)button custEffet:(NSString *)custEffet;
+ (void)cellHeightCusteffet:(NSString *)custEffet;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated custEffet:(NSString *)custEffet;

@end
