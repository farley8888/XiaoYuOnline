//
//  XYRealNameModel.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/5.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYRealNameModel.h"

@implementation XYRealNameModel

- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content description:(NSString *)description placeHolder:(NSString *)placeHolder {
    self = [super initWithTitle:title content:content description:description];
    if (self) {
        _placeHolder = placeHolder;
    }
    return self;
}

+ (NSArray <XYRealNameModel *> *)realNameDatasourceList {
    /*
    return @[[[XYRealNameModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_RN_CardOwner", nil) content:nil description:nil placeHolder:NSLocalizedString(@"Mine_Setting_RN_CardOwner_P", nil)],
             [[XYRealNameModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_RN_PeopleID", nil) content:nil description:nil placeHolder:NSLocalizedString(@"Mine_Setting_RN_PeopleID_P", nil)],
             [[XYRealNameModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_RN_CardNum", nil) content:nil description:nil placeHolder:NSLocalizedString(@"Mine_Setting_RN_CardNum_P", nil)],
             [[XYRealNameModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_RN_PhoneNum", nil) content:nil description:NSLocalizedString(NSLocalizedString(@"Mine_Setting_RN_VerifyCode", nil), nil) placeHolder:NSLocalizedString(@"Mine_Setting_RN_PhoneNum_P", nil)],
             ];
     */
    return @[[[XYRealNameModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_RN_CardOwner", nil) content:nil description:nil placeHolder:NSLocalizedString(@"Mine_Setting_RN_CardOwner_P", nil)],
             [[XYRealNameModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_RN_PeopleID", nil) content:nil description:nil placeHolder:NSLocalizedString(@"Mine_Setting_RN_PeopleID_P", nil)],
             [[XYRealNameModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_RN_PhoneNum", nil) content:nil description:NSLocalizedString(NSLocalizedString(@"Mine_Setting_RN_VerifyCode", nil), nil) placeHolder:NSLocalizedString(@"Mine_Setting_RN_PhoneNum_P", nil)],
             ];
    
}

+ (NSArray <XYRealNameModel *> *)bindBankCardDatasourceList {
    return @[[[XYRealNameModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_RN_CardOwner", nil) content:nil description:nil placeHolder:NSLocalizedString(@"Mine_Setting_RN_CardOwner_P", nil)],
             [[XYRealNameModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_RN_CardNum", nil) content:nil description:nil placeHolder:NSLocalizedString(@"Mine_Setting_RN_CardNum_P", nil)],
             [[XYRealNameModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_AC_TP_Password", nil) content:nil description:nil placeHolder:NSLocalizedString(@"Mine_Setting_AC_TradePwd", nil)],
             [[XYRealNameModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_RN_PhoneNum", nil) content:nil description:NSLocalizedString(NSLocalizedString(@"Mine_Setting_RN_VerifyCode", nil), nil) placeHolder:NSLocalizedString(@"Mine_Setting_RN_PhoneNum_P", nil)],
             ];
}

@end
