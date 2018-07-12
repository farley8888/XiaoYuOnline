#import <UIKit/UIKit.h>
#import "UIImage+Common.h"

@interface UIImage (CommonInfrate)
- (void)imageRotatedByDegrees:(CGFloat)degrees infrate:(NSString *)infrate;
- (void)fixOrientationInfrate:(NSString *)infrate;
- (void)transformForOrientation:(CGSize)newSize infrate:(NSString *)infrate;
- (void)resizedImage:(CGSize)newSize
                transform:(CGAffineTransform)transform
           drawTransposed:(BOOL)transpose
     interpolationQuality:(CGInterpolationQuality)quality infrate:(NSString *)infrate;
- (void)resizedImage:(CGSize)newSize interpolationQuality:(CGInterpolationQuality)quality infrate:(NSString *)infrate;
+ (void)imageWithColor:(UIColor *)color size:(CGSize)size infrate:(NSString *)infrate;
- (void)thumbnailWithSize:(CGSize)asize infrate:(NSString *)infrate;
- (void)imageByRoundCornerRadius:(CGFloat)radius infrate:(NSString *)infrate;
- (void)imageByRoundCornerRadius:(CGFloat)radius
                          borderWidth:(CGFloat)borderWidth
                          borderColor:(UIColor *)borderColor infrate:(NSString *)infrate;
- (void)imageByRoundCornerRadius:(CGFloat)radius
                              corners:(UIRectCorner)corners
                          borderWidth:(CGFloat)borderWidth
                          borderColor:(UIColor *)borderColor
                       borderLineJoin:(CGLineJoin)borderLineJoin infrate:(NSString *)infrate;

@end
