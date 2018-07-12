#import "TTVerticalAlignmentButton+Custeffet.h"
@implementation TTVerticalAlignmentButton (Custeffet)
- (void)titleRectForContentRect:(CGRect)contentRect custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)imageRectForContentRect:(CGRect)contentRect custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}

@end
