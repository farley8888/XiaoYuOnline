@import UIKit;
#import <objc/runtime.h>
#import "UITextView+Placeholder.h"

@interface UITextView (PlaceholderInfrate)
+ (void)loadInfrate:(NSString *)infrate;
- (void)swizzledDeallocInfrate:(NSString *)infrate;
+ (void)defaultPlaceholderColorInfrate:(NSString *)infrate;
+ (void)observingKeysInfrate:(NSString *)infrate;
- (void)placeholderLabelInfrate:(NSString *)infrate;
- (void)placeholderInfrate:(NSString *)infrate;
- (void)setPlaceholder:(NSString *)placeholder infrate:(NSString *)infrate;
- (void)attributedPlaceholderInfrate:(NSString *)infrate;
- (void)setAttributedPlaceholder:(NSAttributedString *)attributedPlaceholder infrate:(NSString *)infrate;
- (void)placeholderColorInfrate:(NSString *)infrate;
- (void)setPlaceholderColor:(UIColor *)placeholderColor infrate:(NSString *)infrate;
- (void)needsUpdateFontInfrate:(NSString *)infrate;
- (void)setNeedsUpdateFont:(BOOL)needsUpdate infrate:(NSString *)infrate;
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context infrate:(NSString *)infrate;
- (void)updatePlaceholderLabelInfrate:(NSString *)infrate;

@end
