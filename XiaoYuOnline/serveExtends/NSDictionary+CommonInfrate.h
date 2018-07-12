#import <Foundation/Foundation.h>
#import "NSDictionary+Common.h"

@interface NSDictionary (CommonInfrate)
- (void)allKeysSortedInfrate:(NSString *)infrate;
- (void)allValuesSortedByKeysInfrate:(NSString *)infrate;
- (void)containsObjectForKey:(id)key infrate:(NSString *)infrate;
- (void)entriesForKeys:(NSArray *)keys infrate:(NSString *)infrate;
- (void)jsonStringEncodedInfrate:(NSString *)infrate;
- (void)jsonPrettyStringEncodedInfrate:(NSString *)infrate;
- (void)boolValueForKey:(NSString *)key default:(BOOL)def infrate:(NSString *)infrate;
- (void)charValueForKey:(NSString *)key default:(char)def infrate:(NSString *)infrate;
- (void)unsignedCharValueForKey:(NSString *)key default:(unsigned char)def infrate:(NSString *)infrate;
- (void)shortValueForKey:(NSString *)key default:(short)def infrate:(NSString *)infrate;
- (void)unsignedShortValueForKey:(NSString *)key default:(unsigned short)def infrate:(NSString *)infrate;
- (void)intValueForKey:(NSString *)key default:(int)def infrate:(NSString *)infrate;
- (void)unsignedIntValueForKey:(NSString *)key default:(unsigned int)def infrate:(NSString *)infrate;
- (void)longValueForKey:(NSString *)key default:(long)def infrate:(NSString *)infrate;
- (void)unsignedLongValueForKey:(NSString *)key default:(unsigned long)def infrate:(NSString *)infrate;
- (void)longLongValueForKey:(NSString *)key default:(long long)def infrate:(NSString *)infrate;
- (void)unsignedLongLongValueForKey:(NSString *)key default:(unsigned long long)def infrate:(NSString *)infrate;
- (void)floatValueForKey:(NSString *)key default:(float)def infrate:(NSString *)infrate;
- (void)doubleValueForKey:(NSString *)key default:(double)def infrate:(NSString *)infrate;
- (void)integerValueForKey:(NSString *)key default:(NSInteger)def infrate:(NSString *)infrate;
- (void)unsignedIntegerValueForKey:(NSString *)key default:(NSUInteger)def infrate:(NSString *)infrate;
- (void)numberValueForKey:(NSString *)key default:(NSNumber *)def infrate:(NSString *)infrate;
- (void)stringValueForKey:(NSString *)key default:(NSString *)def infrate:(NSString *)infrate;

@end
