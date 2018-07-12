#import "OLUser+Custeffet.h"
@implementation OLUser (Custeffet)
+ (void)currentUserCusteffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)initWithUserState:(OLUserState)state custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)userSignOutCusteffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)updateUserWithLoginApiData:(NSDictionary *)data custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)updateUserAssetWithApiData:(NSDictionary *)data custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)updateUserCardInfoWithData:(NSDictionary *)data custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)updateUserRealNameWithData:(NSDictionary *)data custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}

@end
