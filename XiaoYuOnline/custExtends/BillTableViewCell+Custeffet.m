#import "BillTableViewCell+Custeffet.h"
@implementation BillTableViewCell (Custeffet)
- (void)awakeFromNibCusteffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}

@end
