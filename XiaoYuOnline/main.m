//
//  main.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/2.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#define UP_TIME @"2018-07-19"  //提交审核时间
#define REQUEST_TIMEOUT 30 //请求超时时间（单位秒）

#define ExaminingTime 6 //默认审核天数
#define ExaminedTime 15 //默认审核通过时间（超过此时间默认通过）

#define MY_VERSION @"mYclientVersion" //已经安装的版本，默认和build一致
#define KEY_EXAMIN @"mYisExamin" //是否审核通过标识

#define KEY_ErrorTimes @"mYRequestErrorTimes" //请求错误次数，超过两次进入主项目
#define KaiGuan @"https://wechat.meipenggang.com/b" //开关接口

int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSString *clientVersion = [[NSUserDefaults standardUserDefaults] stringForKey:MY_VERSION];
        //判断应用程序是否更新了版本
//        DLOG(@"clientVersion = [%@]", clientVersion);
//        [DataUtil setResult:YES]; //默认审核通过
        
        //正常使用并且通过了审核
//        if ([clientVersion isEqualToString:CLIENT_VERSION] && [[NSUserDefaults standardUserDefaults] boolForKey:KEY_EXAMIN]) {
//            DLOG(@"未更新,正常使用");
            return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
            
//        }else { //if (clientVersion == nil)
//            DLOG(@"需检测或更新了");
//
//            if ([MyTools isInTimeFromString:UP_TIME addMonth:0 day:ExaminingTime]) {
//                DLOG(@"审核时间内。直接跳审核项目");
//                [DataUtil setResult:NO];
////                return UIApplicationMain(argc, argv, nil, NSStringFromClass([FAppDelegate class]));
//                return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
//            }
//            else if (![MyTools isInTimeFromString:UP_TIME addMonth:0 day:ExaminedTime]) {
//                DLOG(@"超过默认审核时间，直接进入主项目");
//                return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
//            }
//            else {
//                
//                __block BOOL isExamined = NO;
//                //                __block NSInteger errTimes = [[NSUserDefaults standardUserDefaults] integerForKey:KEY_ErrorTimes];
//                dispatch_semaphore_t disp = dispatch_semaphore_create(0);
//                
//                [MyTools hidenNetworkActitvityIndicator];
//                
//                
//                NSMutableString *mutableUrl = [[NSMutableString alloc] initWithString:KaiGuan];
//                NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:mutableUrl] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:REQUEST_TIMEOUT];
//                
//                NSURLSession *urlSession = [NSURLSession sharedSession];
//                NSURLSessionDataTask *dataTask = [urlSession dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//                    
//                    if (error) {
//        //                        NSString *errorDescription = error.localizedDescription;
//                        DLOG(@"main请求error = %@", error);
//                        isExamined = NO;
//        //                        [[NSUserDefaults standardUserDefaults] setInteger:errTimes+1 forKey:KEY_ErrorTimes];
//                        
//                    } else {
//                        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//                        DLOG(@"main请求 = %@", dic);
//                        
//                        //   isexamined:1, //1通过，0审核中，2被拒
//                        //    newversion:1.2.* //最新版本 备用
//                        
//                        isExamined = ([[dic objectForKey:@"isexamined"] integerValue] == 1);
//                    }
//                    
//                    dispatch_semaphore_signal(disp);
//                }];
//                [dataTask resume];
//                //   [dataTask cancel];
//                
//                dispatch_semaphore_wait(disp, DISPATCH_TIME_FOREVER);
//                
//                [[NSUserDefaults standardUserDefaults] setBool:isExamined forKey:KEY_EXAMIN];
//                
//                if (isExamined )  { //通过后 //|| errTimes >= 2 或错误响应超过两次
//                    [[NSUserDefaults standardUserDefaults] setObject:CLIENT_VERSION forKey:MY_VERSION];
//                    return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
//                }
//                else {
//                    [DataUtil setResult:NO];
////                    return UIApplicationMain(argc, argv, nil, NSStringFromClass([FAppDelegate class]));
//                    return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
//                }
//            }
//            
//        }
    }
}

