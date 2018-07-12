//
//  XYSettingModel.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/5.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "SettingModel.h"
#import "NSString+Common.h"

@implementation SettingModel

+ (NSArray <NSArray<SettingModel *> *> *)settingDatasourceList {
    NSString *realName;
    NSString *bindCard;
    if (XYCurrentUser.partCardID) {
        realName = [NSString stringWithFormat:@"已认证 %@", XYCurrentUser.partCardID];
    } else {
        realName = @"请认证";
    }
    
    if (XYCurrentUser.bankCardID) {
        bindCard = [NSString stringWithFormat:@"已绑定 %@", XYCurrentUser.partBankCardID];
    } else {
        bindCard = @"请绑定";
    }
    
    return @[@[[[SettingModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_RealName", nil) content:realName description:nil],
               [[SettingModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_PhoneAus", nil) content:XYCurrentUser.partPhoneNumber description:nil],
               [[SettingModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_BindCard", nil) content:bindCard description:nil],
               [[SettingModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_AccoutSafe", nil) content:nil description:nil],
               ],
             @[[[SettingModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_ReceiveAddress", nil) content:nil description:nil],],
             @[[[SettingModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_Update", nil) content:[NSString appVersion] description:nil],]
             ];
}

@end
