#import "BidThirdViewCell+Custeffet.h"
@implementation BidThirdViewCell (Custeffet)
- (void)awakeFromNibCusteffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
+ (void)cellHeightWithContent:(NSString *)content custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}

@end
