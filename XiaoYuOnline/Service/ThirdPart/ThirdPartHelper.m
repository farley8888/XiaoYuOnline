//
//  ThirdPartHelper.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/24.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "ThirdPartHelper.h"
#import <XMNetworking/XMNetworking.h>
#import "NSString+Common.h"
#import "OLURLDefine.h"

NSErrorDomain const XYNetworkErrorDomain = @"XYNetworkErrorDomain";

@implementation ThirdPartHelper

+ (void)configNetwork {
    [[XMCenter defaultCenter] setupConfig:^(XMConfig * _Nonnull config) {
        config.generalServer = XYBaseURL;
        config.generalParameters = @{@"version":[NSString appVersion]};
        config.callbackQueue = dispatch_get_main_queue();
        config.engine = [XMEngine sharedEngine];
#ifdef DEBUG
        config.consoleLog = YES;
#endif
    }];
    
    // 设置全局响应预处理
    [XMCenter setResponseProcessBlock:^id(XMRequest * _Nonnull request, id  _Nullable responseObject, NSError *__autoreleasing  _Nullable * _Nullable error) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSNumber *success = responseObject[@"success"];
            if (success && !success.boolValue) {
                NSString *errorMsg = responseObject[@"error"];
                if (!errorMsg) {
                    errorMsg = responseObject[@"message"];
                }
                if (!errorMsg) {
                    errorMsg = @"服务器未给出 ErrorMessage！";
                }
                NSDictionary *userInfo = nil;
                if (errorMsg) {
                    userInfo = @{ NSLocalizedDescriptionKey :errorMsg};
                }
                *error = [NSError errorWithDomain:XYNetworkErrorDomain code:1001 userInfo:userInfo];
            }
        }
        return nil;
    }];
    
    // 设置全局请求预处理
    [XMCenter setRequestProcessBlock:^(XMRequest * _Nonnull request) {
        request.timeoutInterval = 20;
    }];
}

@end
