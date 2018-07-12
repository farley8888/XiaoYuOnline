#import <UIKit/UIKit.h>
#import "CustomTextEdgeField.h"

@interface CustomTextEdgeField (Custeffet)
- (void)textRectForBounds:(CGRect)bounds custEffet:(NSString *)custEffet;
- (void)placeholderRectForBounds:(CGRect)bounds custEffet:(NSString *)custEffet;
- (void)editingRectForBounds:(CGRect)bounds custEffet:(NSString *)custEffet;
- (void)leftViewRectForBounds:(CGRect)bounds custEffet:(NSString *)custEffet;
- (void)rightViewRectForBounds:(CGRect)bounds custEffet:(NSString *)custEffet;

@end
