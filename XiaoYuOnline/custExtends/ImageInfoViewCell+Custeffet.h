#import <UIKit/UIKit.h>
#import "ImageInfoViewCell.h"

@interface ImageInfoViewCell (Custeffet)
- (void)awakeFromNibCusteffet:(NSString *)custEffet;
- (void)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier custEffet:(NSString *)custEffet;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated custEffet:(NSString *)custEffet;

@end
