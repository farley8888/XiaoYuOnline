#import "FastLoginView+Custeffet.h"
@implementation FastLoginView (Custeffet)
- (void)initWithFrame:(CGRect)frame custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)textFieldValueChangedCusteffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}

@end
