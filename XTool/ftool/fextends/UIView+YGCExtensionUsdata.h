#import <UIKit/UIKit.h>
#import "UIView+YGCExtension.h"

@interface UIView (YGCExtensionUsdata)
+ (void)viewFromXibUsdata:(NSString *)usData;
- (void)setX:(CGFloat)x usData:(NSString *)usData;
- (void)xUsdata:(NSString *)usData;
- (void)setY:(CGFloat)y usData:(NSString *)usData;
- (void)yUsdata:(NSString *)usData;
- (void)setWidth:(CGFloat)width usData:(NSString *)usData;
- (void)widthUsdata:(NSString *)usData;
- (void)setHeight:(CGFloat)height usData:(NSString *)usData;
- (void)heightUsdata:(NSString *)usData;
- (void)setCenterX:(CGFloat)centerX usData:(NSString *)usData;
- (void)centerXUsdata:(NSString *)usData;
- (void)setCenterY:(CGFloat)centerY usData:(NSString *)usData;
- (void)centerYUsdata:(NSString *)usData;
- (void)leftUsdata:(NSString *)usData;
- (void)setLeft:(CGFloat)x usData:(NSString *)usData;
- (void)topUsdata:(NSString *)usData;
- (void)setTop:(CGFloat)y usData:(NSString *)usData;
- (void)rightUsdata:(NSString *)usData;
- (void)setRight:(CGFloat)right usData:(NSString *)usData;
- (void)bottomUsdata:(NSString *)usData;
- (void)setBottom:(CGFloat)bottom usData:(NSString *)usData;
- (void)originUsdata:(NSString *)usData;
- (void)setOrigin:(CGPoint)origin usData:(NSString *)usData;
- (void)sizeUsdata:(NSString *)usData;
- (void)setSize:(CGSize)size usData:(NSString *)usData;
- (void)GetParentViewBySubView:(UIView *)subView parentViewClass:(Class)parentViewClass usData:(NSString *)usData;
- (void)GetParentViewControllerBySubView:(UIView *)subView ParentViewControllerClass:(Class)parentViewControllerClass usData:(NSString *)usData;
- (void)findViewWithClassName:(NSString *)aName usData:(NSString *)usData;

@end
