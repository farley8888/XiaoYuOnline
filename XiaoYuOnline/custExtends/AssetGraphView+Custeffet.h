#import <UIKit/UIKit.h>
#import "AssetGraphView.h"

@interface AssetGraphView (Custeffet)
- (void)initWithCoder:(NSCoder *)aDecoder custEffet:(NSString *)custEffet;
- (void)initWithFrame:(CGRect)frame custEffet:(NSString *)custEffet;
- (void)commomInitCusteffet:(NSString *)custEffet;
- (void)layoutSubviewsCusteffet:(NSString *)custEffet;
- (void)setProgress:(float)progress animate:(BOOL)animate custEffet:(NSString *)custEffet;
- (void)setProgress:(float)progress custEffet:(NSString *)custEffet;
- (void)setCircleFrameWithProgress:(float)progress custEffet:(NSString *)custEffet;

@end
