#import "JinnLockCircle+Infrate.h"
@implementation JinnLockCircle (Infrate)
- (void)initWithDiameter:(CGFloat)diameter infrate:(NSString *)infrate {
    NSLog(@"%@", infrate);
}
- (void)updateCircleState:(JinnLockCircleState)state infrate:(NSString *)infrate {
    NSLog(@"%@", infrate);
}
- (void)drawRect:(CGRect)rect infrate:(NSString *)infrate {
    NSLog(@"%@", infrate);
}
- (void)drawEmptyCircleWithContext:(CGContextRef)context
                              rect:(CGRect)rect
                       strokeColor:(UIColor *)strokeColor
                         fillColor:(UIColor *)fillColor infrate:(NSString *)infrate {
    NSLog(@"%@", infrate);
}
- (void)drawSolidCircleWithContext:(CGContextRef)context
                              rect:(CGRect)rect
                       strokeColor:(UIColor *)strokeColor infrate:(NSString *)infrate {
    NSLog(@"%@", infrate);
}
- (void)drawCenterCircleWithContext:(CGContextRef)context
                               rect:(CGRect)rect
                         centerRect:(CGRect)centerRect
                        strokeColor:(UIColor *)strokeColor
                          fillColor:(UIColor *)fillColor infrate:(NSString *)infrate {
    NSLog(@"%@", infrate);
}

@end
