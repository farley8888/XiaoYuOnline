#import <UIKit/UIKit.h>
#import "UIView+Common.h"

@interface UIView (FrameLayoutMethodInfrate)
- (void)heightInfrate:(NSString *)infrate;
- (void)widthInfrate:(NSString *)infrate;
- (void)xInfrate:(NSString *)infrate;
- (void)setX:(CGFloat)x infrate:(NSString *)infrate;
- (void)setY:(CGFloat)y infrate:(NSString *)infrate;
- (void)yInfrate:(NSString *)infrate;
- (void)sizeInfrate:(NSString *)infrate;
- (void)originInfrate:(NSString *)infrate;
- (void)centerXInfrate:(NSString *)infrate;
- (void)centerYInfrate:(NSString *)infrate;
- (void)bottomInfrate:(NSString *)infrate;
- (void)rightInfrate:(NSString *)infrate;
- (void)setHeight:(CGFloat)height infrate:(NSString *)infrate;
- (void)heightEqualToView:(UIView *)view infrate:(NSString *)infrate;
- (void)setWidth:(CGFloat)width infrate:(NSString *)infrate;
- (void)widthEqualToView:(UIView *)view infrate:(NSString *)infrate;
- (void)setCenterX:(CGFloat)centerX infrate:(NSString *)infrate;
- (void)setCenterY:(CGFloat)centerY infrate:(NSString *)infrate;
- (void)centerXEqualToView:(UIView *)view infrate:(NSString *)infrate;
- (void)centerYEqualToView:(UIView *)view infrate:(NSString *)infrate;
- (void)top:(CGFloat)top FromView:(UIView *)view infrate:(NSString *)infrate;
- (void)bottom:(CGFloat)bottom FromView:(UIView *)view infrate:(NSString *)infrate;
- (void)left:(CGFloat)left FromView:(UIView *)view infrate:(NSString *)infrate;
- (void)right:(CGFloat)right FromView:(UIView *)view infrate:(NSString *)infrate;
- (void)topInContainer:(CGFloat)top shouldResize:(BOOL)shouldResize infrate:(NSString *)infrate;
- (void)bottomInContainer:(CGFloat)bottom shouldResize:(BOOL)shouldResize infrate:(NSString *)infrate;
- (void)leftInContainer:(CGFloat)left shouldResize:(BOOL)shouldResize infrate:(NSString *)infrate;
- (void)rightInContainer:(CGFloat)right shouldResize:(BOOL)shouldResize infrate:(NSString *)infrate;
- (void)topEqualToView:(UIView *)view infrate:(NSString *)infrate;
- (void)bottomEqualToView:(UIView *)view infrate:(NSString *)infrate;
- (void)leftEqualToView:(UIView *)view infrate:(NSString *)infrate;
- (void)rightEqualToView:(UIView *)view infrate:(NSString *)infrate;
- (void)setSize:(CGSize)size infrate:(NSString *)infrate;
- (void)sizeEqualToView:(UIView *)view infrate:(NSString *)infrate;
- (void)fillWidthInfrate:(NSString *)infrate;
- (void)fillHeightInfrate:(NSString *)infrate;
- (void)fillInfrate:(NSString *)infrate;
- (void)topSuperViewInfrate:(NSString *)infrate;

@end
