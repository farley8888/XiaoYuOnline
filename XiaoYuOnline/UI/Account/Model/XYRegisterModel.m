//
//  XYRegisterModel.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/14.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYRegisterModel.h"

@implementation XYRegisterModel

+ (NSArray <XYRegisterModel *> *)registerDatasourceList {
    return @[[[XYRegisterModel alloc] initWithTitle:NSLocalizedString(@"Public_PhoneNum.", nil) content:nil description:nil placeHolder:NSLocalizedString(@"Account_InputPhoneNum_PH", nil)],
//             [[XYRegisterModel alloc] initWithTitle:NSLocalizedString(@"Public_VerifyCode", nil) content:nil description:nil placeHolder:NSLocalizedString(@"Account_InputVerifyCode_PH", nil)],
             [[XYRegisterModel alloc] initWithTitle:NSLocalizedString(@"Public_VerifyCode", nil) content:nil description:NSLocalizedString(@"Account_GetVerifyCode", nil) placeHolder:NSLocalizedString(@"Account_InputMessageCode_PH", nil)],
             [[XYRegisterModel alloc] initWithTitle:NSLocalizedString(@"Account_InputLoginPassword", nil) content:nil description:nil placeHolder:NSLocalizedString(@"Account_InputLoginPassword_PH", nil)],
             [[XYRegisterModel alloc] initWithTitle:NSLocalizedString(@"Account_InviteFriend", nil) content:nil description:nil placeHolder:NSLocalizedString(@"Account_InviteFriend_PH", nil)]
             ];
}

@end
