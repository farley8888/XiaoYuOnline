//
//  RealNameModel.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/5.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "RealNameModel.h"

@implementation RealNameModel

- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content description:(NSString *)description placeHolder:(NSString *)placeHolder {
    self = [super initWithTitle:title content:content description:description];
    if (self) {
        _placeHolder = placeHolder;
    }
    return self;
}

+ (NSArray <RealNameModel *> *)realNameDatasourceList {
    /*
    return @[[[RealNameModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_RN_CardOwner", nil) content:nil description:nil placeHolder:NSLocalizedString(@"Mine_Setting_RN_CardOwner_P", nil)],
             [[RealNameModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_RN_PeopleID", nil) content:nil description:nil placeHolder:NSLocalizedString(@"Mine_Setting_RN_PeopleID_P", nil)],
             [[RealNameModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_RN_CardNum", nil) content:nil description:nil placeHolder:NSLocalizedString(@"Mine_Setting_RN_CardNum_P", nil)],
             [[RealNameModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_RN_PhoneNum", nil) content:nil description:NSLocalizedString(NSLocalizedString(@"Mine_Setting_RN_VerifyCode", nil), nil) placeHolder:NSLocalizedString(@"Mine_Setting_RN_PhoneNum_P", nil)],
             ];
     */
    return @[[[RealNameModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_RN_CardOwner", nil) content:nil description:nil placeHolder:NSLocalizedString(@"Mine_Setting_RN_CardOwner_P", nil)],
             [[RealNameModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_RN_PeopleID", nil) content:nil description:nil placeHolder:NSLocalizedString(@"Mine_Setting_RN_PeopleID_P", nil)],
             [[RealNameModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_RN_PhoneNum", nil) content:nil description:NSLocalizedString(NSLocalizedString(@"Mine_Setting_RN_VerifyCode", nil), nil) placeHolder:NSLocalizedString(@"Mine_Setting_RN_PhoneNum_P", nil)],
             ];
    
}

+ (NSArray <RealNameModel *> *)bindBankCardDatasourceList {
    return @[[[RealNameModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_RN_CardOwner", nil) content:nil description:nil placeHolder:NSLocalizedString(@"Mine_Setting_RN_CardOwner_P", nil)],
             [[RealNameModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_RN_CardNum", nil) content:nil description:nil placeHolder:NSLocalizedString(@"Mine_Setting_RN_CardNum_P", nil)],
             [[RealNameModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_AC_TP_Password", nil) content:nil description:nil placeHolder:NSLocalizedString(@"Mine_Setting_AC_TradePwd", nil)],
             [[RealNameModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_RN_PhoneNum", nil) content:nil description:NSLocalizedString(NSLocalizedString(@"Mine_Setting_RN_VerifyCode", nil), nil) placeHolder:NSLocalizedString(@"Mine_Setting_RN_PhoneNum_P", nil)],
             ];
}

@end
