#import <UIKit/UIKit.h>
#import "JinnLockCircle.h"
#import "JinnLockConfig.h"

@interface JinnLockCircle (Infrate)
- (void)initWithDiameter:(CGFloat)diameter infrate:(NSString *)infrate;
- (void)updateCircleState:(JinnLockCircleState)state infrate:(NSString *)infrate;
- (void)drawRect:(CGRect)rect infrate:(NSString *)infrate;
- (void)drawEmptyCircleWithContext:(CGContextRef)context
                              rect:(CGRect)rect
                       strokeColor:(UIColor *)strokeColor
                         fillColor:(UIColor *)fillColor infrate:(NSString *)infrate;
- (void)drawSolidCircleWithContext:(CGContextRef)context
                              rect:(CGRect)rect
                       strokeColor:(UIColor *)strokeColor infrate:(NSString *)infrate;
- (void)drawCenterCircleWithContext:(CGContextRef)context
                               rect:(CGRect)rect
                         centerRect:(CGRect)centerRect
                        strokeColor:(UIColor *)strokeColor
                          fillColor:(UIColor *)fillColor infrate:(NSString *)infrate;

@end
