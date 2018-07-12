//
//  XYUser.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/25.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OLUserAsset.h"

/**
 用户状态

 - OLUserStateUnknown: 未知
 - OLUserStateSignOut: 已登出
 - OLUserStateLogin: 已登录
 - OLUserStateAccountException: 账号异常
 */

#define XYCurrentUser [OLUser currentUser]
typedef NS_ENUM(NSUInteger, OLUserState) {
    OLUserStateUnknown,
    OLUserStateSignOut,
    OLUserStateLogin,
    OLUserStateAccountException
};

@interface OLUser : NSObject
// 用户 ID
@property (nonatomic, copy) NSString *userID;
// 昵称
@property (nonatomic, copy) NSString *nickname;
// 姓名
@property (nonatomic, copy) NSString *realName;
// 头像
@property (nonatomic, copy) NSString *avatar;
// 手机号
@property (nonatomic, copy) NSString *phoneNumber;
// 部分显示的手机号
@property (nonatomic, copy) NSString *partPhoneNumber;
// 用户 Api ID
@property (nonatomic, copy) NSString *apiID;
// 身份证号
@property (nonatomic, copy) NSString *cardID;
// 部分显示的身份证号
@property (nonatomic, copy) NSString *partCardID;
// 银行名称
@property (nonatomic, copy) NSString *bankName;
// 银行卡号
@property (nonatomic, copy) NSString *bankCardID;
// 银行卡标识符
@property (nonatomic, copy) NSString *bankCardIdentifier;
// 部分显示的银行卡号
@property (nonatomic, copy) NSString *partBankCardID;
// 推荐手机号
@property (nonatomic, copy) NSString *recommendPhoneNum;
// 用户类型
@property (nonatomic, assign) int userType;
// 用户注册时间
@property (nonatomic, assign) NSTimeInterval createTime;
// Api 状态
@property (nonatomic, assign) int apiStatus;
@property (nonatomic, assign) BOOL appSign;
// 用户状态
@property (nonatomic, assign) OLUserState userState;
// 用户资产
@property (nonatomic, readonly) OLUserAsset *userAsset;

- (instancetype)init NS_UNAVAILABLE;
- (void)userSignOut;
+ (instancetype)currentUser;

- (void)updateUserWithLoginApiData:(NSDictionary *)data;
- (void)updateUserCardInfoWithData:(NSDictionary *)data;
- (void)updateUserRealNameWithData:(NSDictionary *)data;

- (OLUserAsset *)updateUserAssetWithApiData:(NSDictionary *)data;

FOUNDATION_EXTERN NSNotificationName const OLUserDidLoginNotification;
FOUNDATION_EXTERN NSNotificationName const OLUserDidLogoutNotification;
FOUNDATION_EXTERN NSNotificationName const OLUserDidRegisterNotification;
FOUNDATION_EXPORT NSNotificationName const OLUserInfoDidChangedNotification;
FOUNDATION_EXPORT NSNotificationName const OLUserAssetDidChangedNotification;

@end
