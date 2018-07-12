#import <UIKit/UIKit.h>
#import "JinnLockIndicator.h"
#import "JinnLockConfig.h"
#import "JinnLockCircle.h"

@interface JinnLockIndicator (Infrate)
- (void)initInfrate:(NSString *)infrate;
- (void)setupInfrate:(NSString *)infrate;
- (void)initCirclesInfrate:(NSString *)infrate;
- (void)showPassword:(NSString *)password infrate:(NSString *)infrate;
- (void)resetInfrate:(NSString *)infrate;
- (void)drawRect:(CGRect)rect infrate:(NSString *)infrate;

@end
