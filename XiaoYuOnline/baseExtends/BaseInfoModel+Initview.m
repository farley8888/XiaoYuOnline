#import "BaseInfoModel+Initview.h"
@implementation BaseInfoModel (Initview)
- (void)initWithTitle:(NSString *)title content:(NSString *)content description:(NSString *)description initView:(NSString *)initView {
    NSLog(@"%@", initView);
}

@end
