//
//  UserDefaultsHelper.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/3.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "UserDefaultsHelper.h"
#import "NSString+Common.h"
#import "UserDefaultsHelper+Infrate.h"

static NSString *kLocalVersionKey = @"XYLocalAppVersion";

@implementation UserDefaultsHelper

+ (BOOL)isFirstLaunchOrUpdate
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *localVersion = [defaults valueForKey:kLocalVersionKey];
    NSString *appVersion = [NSString appVersion];
    if (!localVersion) {
        [defaults setObject:appVersion forKey:kLocalVersionKey];
        [defaults synchronize];
        
        return YES;
    }
    
    NSComparisonResult result = [appVersion compare:localVersion];
    if (result == NSOrderedDescending) {
        [defaults setObject:appVersion forKey:kLocalVersionKey];
        [defaults synchronize];
        
        return YES;
    }
    
    return NO;
}

@end
