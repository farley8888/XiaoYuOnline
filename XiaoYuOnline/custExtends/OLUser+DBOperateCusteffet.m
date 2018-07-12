#import "OLUser+DBOperateCusteffet.h"
@implementation OLUser (DBOperateCusteffet)
- (void)initDBLoginUserInDBCusteffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)updateLoginUserInDBCusteffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)updateCard:(NSString *)cardID realName:(NSString *)realName partCardID:(NSString *)partCardID custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)updateBank:(NSString *)bankNum name:(NSString *)name partBankNum:(NSString *)partBankNum bankID:(NSString *)bankID custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)userDidSignOutCusteffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}

@end
