#import <UIKit/UIKit.h>
#import "MineTableHeaderView.h"
#import "AssetGraphView.h"

@interface MineTableHeaderView (Custeffet)
- (void)initWithFrame:(CGRect)frame custEffet:(NSString *)custEffet;
- (void)layoutSubviewsCusteffet:(NSString *)custEffet;
- (void)avatarButtonActionCusteffet:(NSString *)custEffet;
- (void)chargeButtonActionCusteffet:(NSString *)custEffet;
- (void)withdrawButtonActionCusteffet:(NSString *)custEffet;
- (void)setUserDidLoginState:(BOOL)animate custEffet:(NSString *)custEffet;
- (void)setUserDidSignOutState:(BOOL)animate custEffet:(NSString *)custEffet;

@end
