#import <Foundation/Foundation.h>
#import "CalculateMethod.h"

@interface CalculateMethod (Usdata)
- (void)initUsdata:(NSString *)usData;
- (void)performOperation:(int)input usData:(NSString *)usData;
- (void)clearUsdata:(NSString *)usData;

@end
