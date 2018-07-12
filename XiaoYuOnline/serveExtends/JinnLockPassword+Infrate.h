#import <UIKit/UIKit.h>
#import "JinnLockPassword.h"
#import "JinnLockConfig.h"

@interface JinnLockPassword (Infrate)
+ (void)isEncryptedInfrate:(NSString *)infrate;
+ (void)setNewPassword:(NSString *)password infrate:(NSString *)infrate;
+ (void)oldPasswordInfrate:(NSString *)infrate;
+ (void)removePasswordInfrate:(NSString *)infrate;

@end
