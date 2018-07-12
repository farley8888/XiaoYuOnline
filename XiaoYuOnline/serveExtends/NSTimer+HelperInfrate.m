#import "NSTimer+HelperInfrate.h"
@implementation NSTimer (HelperInfrate)
+ (void)ez_scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(void))inBlock repeats:(BOOL)inRepeats infrate:(NSString *)infrate {
    NSLog(@"%@", infrate);
}
+ (void)ez_timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(void))inBlock repeats:(BOOL)inRepeats infrate:(NSString *)infrate {
    NSLog(@"%@", infrate);
}
+ (void)__executeTimerBlock:(NSTimer *)inTimer infrate:(NSString *)infrate {
    NSLog(@"%@", infrate);
}

@end
