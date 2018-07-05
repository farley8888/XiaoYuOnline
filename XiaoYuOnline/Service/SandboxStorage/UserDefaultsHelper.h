//
//  UserDefaultsHelper.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/3.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDefaultsHelper : NSObject

/**
 是否是第一次启动或者安装过更新

 @return YES 是，NO 不是
 */
+ (BOOL)isFirstLaunchOrUpdate;

@end
