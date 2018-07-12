#import <UIKit/UIKit.h>
#import "SheetPresentStyleView.h"

@interface SheetPresentStyleView (Custeffet)
- (void)initWithFrame:(CGRect)frame custEffet:(NSString *)custEffet;
- (void)showCusteffet:(NSString *)custEffet;
- (void)dismissWithCompletionBlock:(void (^)(BOOL))completion custEffet:(NSString *)custEffet;
- (void)setEnableOutsideTapDismiss:(BOOL)enableOutsideTapDismiss custEffet:(NSString *)custEffet;
- (void)tapToDismissButtonActionCusteffet:(NSString *)custEffet;
- (void)layoutSubviewsCusteffet:(NSString *)custEffet;

@end
