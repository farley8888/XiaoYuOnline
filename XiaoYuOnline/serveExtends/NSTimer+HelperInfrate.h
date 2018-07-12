#import <Foundation/Foundation.h>
#import "NSTimer+Helper.h"

@interface NSTimer (HelperInfrate)
+ (void)ez_scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(void))inBlock repeats:(BOOL)inRepeats infrate:(NSString *)infrate;
+ (void)ez_timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(void))inBlock repeats:(BOOL)inRepeats infrate:(NSString *)infrate;
+ (void)__executeTimerBlock:(NSTimer *)inTimer infrate:(NSString *)infrate;

@end
