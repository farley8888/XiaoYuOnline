#import <Foundation/Foundation.h>
#import "DiscoveryDetailModel.h"
#import <YYKit/NSDictionary+YYAdd.h>
#import "NSString+Common.h"

@interface DiscoveryDetailModel (Custeffet)
- (void)initWithData:(NSDictionary *)data restrictWidth:(CGFloat)width attribute:(NSDictionary *)attribute custEffet:(NSString *)custEffet;

@end
