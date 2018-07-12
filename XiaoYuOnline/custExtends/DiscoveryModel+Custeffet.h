#import "BaseInfoModel.h"
#import "DiscoveryModel.h"
#import <YYKit/NSDictionary+YYAdd.h>

@interface DiscoveryModel (Custeffet)
- (void)initWithDiscoveryApiData:(NSDictionary *)data custEffet:(NSString *)custEffet;
+ (void)discoveryMainDatasourceListCusteffet:(NSString *)custEffet;

@end
