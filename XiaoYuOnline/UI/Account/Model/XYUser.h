//
//  XYUser.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/25.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYUserAsset.h"

/**
 用户状态

 - XYUserStateUnknown: 未知
 - XYUserStateSignOut: 已登出
 - XYUserStateLogin: 已登录
 - XYUserStateAccountException: 账号异常
 */

#define XYCurrentUser [XYUser currentUser]
typedef NS_ENUM(NSUInteger, XYUserState) {
    XYUserStateUnknown,
    XYUserStateSignOut,
    XYUserStateLogin,
    XYUserStateAccountException
};

@interface XYUser : NSObject
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
@property (nonatomic, assign) XYUserState userState;
// 用户资产
@property (nonatomic, readonly) XYUserAsset *userAsset;

- (instancetype)init NS_UNAVAILABLE;
- (void)userSignOut;
+ (instancetype)currentUser;

- (void)updateUserWithLoginApiData:(NSDictionary *)data;
- (void)updateUserCardInfoWithData:(NSDictionary *)data;
- (void)updateUserRealNameWithData:(NSDictionary *)data;

- (XYUserAsset *)updateUserAssetWithApiData:(NSDictionary *)data;

FOUNDATION_EXTERN NSNotificationName const XYUserDidLoginNotification;
FOUNDATION_EXTERN NSNotificationName const XYUserDidLogoutNotification;
FOUNDATION_EXTERN NSNotificationName const XYUserDidRegisterNotification;
FOUNDATION_EXPORT NSNotificationName const XYUserInfoDidChangedNotification;
FOUNDATION_EXPORT NSNotificationName const XYUserAssetDidChangedNotification;

@end
