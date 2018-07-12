#import "MineTableModel+Custeffet.h"
@implementation MineTableModel (Custeffet)
- (void)initWithImage:(UIImage *)image title:(NSString *)title custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
+ (void)mineTableViewItemListCusteffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}

@end
