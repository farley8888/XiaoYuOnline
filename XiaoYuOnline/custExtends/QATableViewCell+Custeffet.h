#import <UIKit/UIKit.h>
#import "QATableViewCell.h"

@interface QATableViewCell (Custeffet)
- (void)awakeFromNibCusteffet:(NSString *)custEffet;
- (void)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier custEffet:(NSString *)custEffet;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated custEffet:(NSString *)custEffet;

@end
