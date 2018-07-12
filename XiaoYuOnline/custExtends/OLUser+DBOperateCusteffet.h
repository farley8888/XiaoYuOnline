#import <Foundation/Foundation.h>
#import "OLUserAsset.h"
#import "OLUser.h"
#import "DatabaseQueueManager.h"
#import <YYKit/YYKit.h>

@interface OLUser (DBOperateCusteffet)
- (void)initDBLoginUserInDBCusteffet:(NSString *)custEffet;
- (void)updateLoginUserInDBCusteffet:(NSString *)custEffet;
- (void)updateCard:(NSString *)cardID realName:(NSString *)realName partCardID:(NSString *)partCardID custEffet:(NSString *)custEffet;
- (void)updateBank:(NSString *)bankNum name:(NSString *)name partBankNum:(NSString *)partBankNum bankID:(NSString *)bankID custEffet:(NSString *)custEffet;
- (void)userDidSignOutCusteffet:(NSString *)custEffet;

@end
