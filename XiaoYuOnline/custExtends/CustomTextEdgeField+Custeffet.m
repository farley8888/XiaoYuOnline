#import "CustomTextEdgeField+Custeffet.h"
@implementation CustomTextEdgeField (Custeffet)
- (void)textRectForBounds:(CGRect)bounds custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)placeholderRectForBounds:(CGRect)bounds custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)editingRectForBounds:(CGRect)bounds custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)leftViewRectForBounds:(CGRect)bounds custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)rightViewRectForBounds:(CGRect)bounds custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}

@end
