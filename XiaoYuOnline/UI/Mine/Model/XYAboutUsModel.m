//
//  XYAboutUsModel.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/5.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYAboutUsModel.h"

@implementation XYAboutUsModel

+ (NSArray <XYAboutUsModel *>*)aboutUsDatasourceList {
    return @[[[XYAboutUsModel alloc] initWithTitle:NSLocalizedString(@"Mine_AboutUs_Web", nil) content:@"www.xiaoyuzx.cn" description:nil],
             [[XYAboutUsModel alloc] initWithTitle:NSLocalizedString(@"Mine_AboutUs_WeChat", nil) content:@"小余在线" description:nil],
             [[XYAboutUsModel alloc] initWithTitle:NSLocalizedString(@"Mine_AboutUs_Weibo", nil) content:@"小余在线" description:nil],
             [[XYAboutUsModel alloc] initWithTitle:NSLocalizedString(@"Mine_AboutUs_Email", nil) content:@"xiaoyuzx2017@163.com" description:nil],
             [[XYAboutUsModel alloc] initWithTitle:NSLocalizedString(@"Mine_AboutUs_Phone", nil) content:@"400-8210-604\n工作时间：9:00-17:00" description:nil],
             ];
}

@end
