#import <UIKit/UIKit.h>
#import "UnderlineView.h"

@interface UnderlineView (Usdata)
- (void)initWithFrame:(CGRect)frame usData:(NSString *)usData;
- (void)addUnderLineUsdata:(NSString *)usData;
- (void)layoutSubviewsUsdata:(NSString *)usData;
- (void)initWithImgName:(NSString *)imgName WithSelectImgName:(NSString *)selectImgName placeContent:(NSString *)content usData:(NSString *)usData;

@end
