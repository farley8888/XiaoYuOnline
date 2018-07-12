#import <UIKit/UIKit.h>
#import "BidThirdViewCell.h"
#import "NSString+Common.h"

@interface BidThirdViewCell (Custeffet)
- (void)awakeFromNibCusteffet:(NSString *)custEffet;
- (void)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier custEffet:(NSString *)custEffet;
+ (void)cellHeightWithContent:(NSString *)content custEffet:(NSString *)custEffet;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated custEffet:(NSString *)custEffet;

@end
