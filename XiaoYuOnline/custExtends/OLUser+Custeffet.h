#import <Foundation/Foundation.h>
#import "OLUserAsset.h"
#import "OLUser.h"
#import "DatabaseQueueManager.h"
#import <YYKit/YYKit.h>

@interface OLUser (Custeffet)
+ (void)currentUserCusteffet:(NSString *)custEffet;
- (void)initWithUserState:(OLUserState)state custEffet:(NSString *)custEffet;
- (void)userSignOutCusteffet:(NSString *)custEffet;
- (void)updateUserWithLoginApiData:(NSDictionary *)data custEffet:(NSString *)custEffet;
- (void)updateUserAssetWithApiData:(NSDictionary *)data custEffet:(NSString *)custEffet;
- (void)updateUserCardInfoWithData:(NSDictionary *)data custEffet:(NSString *)custEffet;
- (void)updateUserRealNameWithData:(NSDictionary *)data custEffet:(NSString *)custEffet;

@end
