//
//  XYUser.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/25.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYUser.h"
#import "XYDatabaseQueueManager.h"
#import <YYKit/YYKit.h>

NSNotificationName const XYUserDidLoginNotification = @"XYUserDidLoginNotification";
NSNotificationName const XYUserDidLogoutNotification = @"XYUserDidLogoutNotification";
NSNotificationName const XYUserDidRegisterNotification = @"XYUserDidRegisterNotification";
NSNotificationName const XYUserInfoDidChangedNotification = @"XYUserInfoDidChangedNotification";
NSNotificationName const XYUserAssetDidChangedNotification = @"XYUserAssetDidChangedNotification";


@interface XYUser (DBOperate)
- (BOOL)updateLoginUserInDB;
- (void)initDBLoginUserInDB;
- (BOOL)userDidSignOut;
- (BOOL)updateCard:(NSString *)cardID realName:(NSString *)realName partCardID:(NSString *)partCardID;
- (BOOL)updateBank:(NSString *)bankNum name:(NSString *)name partBankNum:(NSString *)partBankNum bankID:(NSString *)bankID;
@end

@implementation XYUser

+ (instancetype)currentUser {
    static XYUser *__currentUser;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __currentUser = [[XYUser alloc] initWithUserState:XYUserStateUnknown];
        [__currentUser initDBLoginUserInDB];
    });
    
    return __currentUser;
}

- (instancetype)initWithUserState:(XYUserState)state {
    self = [super init];
    if (self) {
        _userState = state;
    }
    return self;
}

- (void)userSignOut {
    if ([self userDidSignOut]) {
        _userState = XYUserStateSignOut;
        [[NSNotificationCenter defaultCenter] postNotificationName:XYUserDidLogoutNotification object:nil];
    }
}

- (void)updateUserWithLoginApiData:(NSDictionary *)data {
    /*
     addTime": 1501836402000,
     "apiId": "6000060218621197",
     "apiStatus": 1,
     "appSign": 0,
     "cardId": "411122199512308060",
     "hideCardId": "411122********8060",
     "hideEmail": "",
     "hideMobilePhone": "1306****0261",
     "isAutoTransferred": 0,
     "mobilePhone": "13062780261",
     "mobileReg": 1,
     "pwd": "E10ADC3949BA59ABBE56E057F20F883E",
     "realName": "桂雪雪",
     "recommendPhone": "",
     "userId": 1258,
     "userName": "IF13062780261",
     "user_Type": 0
     */
    NSDictionary *userData = data[@"user"];
    _userID = [userData stringValueForKey:@"userId" default:nil];
    _nickname = [userData stringValueForKey:@"userName" default:nil];
    _realName = [userData stringValueForKey:@"realName" default:nil];
    _phoneNumber = [userData stringValueForKey:@"mobilePhone" default:nil];
    _partPhoneNumber = [userData stringValueForKey:@"hideMobilePhone" default:nil];
    _apiID = [userData stringValueForKey:@"apiId" default:nil];
    _cardID = [userData stringValueForKey:@"cardId" default:nil];
    _partCardID = [userData stringValueForKey:@"hideCardId" default:nil];
    _recommendPhoneNum = [userData stringValueForKey:@"recommendPhone" default:nil];
    _userType = [userData intValueForKey:@"user_Type" default:0];
    _apiStatus = [userData intValueForKey:@"apiStatus" default:0];
    _appSign = [userData boolValueForKey:@"appSign" default:NO];
    _createTime = [userData doubleValueForKey:@"addTime" default:0];
    _userState = XYUserStateLogin;
    
    NSDictionary *bankData = data[@"bank"];
    _bankName = [bankData stringValueForKey:@"name" default:nil];
    _bankCardID = [bankData stringValueForKey:@"card" default:nil];
    _partBankCardID = [bankData stringValueForKey:@"secertCard" default:nil];
    _bankCardIdentifier = [bankData stringValueForKey:@"id" default:nil];

    if ([self updateLoginUserInDB]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:XYUserDidLoginNotification object:self userInfo:nil];
    };
}

- (XYUserAsset *)updateUserAssetWithApiData:(NSDictionary *)data {
    if (data) {
        _userAsset = [[XYUserAsset alloc] initWithMineAssetApiData:data];
    }
    return _userAsset;
}

- (void)updateUserCardInfoWithData:(NSDictionary *)data {
    NSString *card = [data stringValueForKey:@"card" default:nil];
    NSString *name = [data stringValueForKey:@"name" default:nil];
    NSString *secC = [data stringValueForKey:@"secertCard" default:nil];
    NSString *cardId = [data stringValueForKey:@"id" default:nil];
    if (card && !secC) {
        NSRange range = NSMakeRange(5, card.length - 9);
        secC = [card stringByReplacingCharactersInRange:range withString:@"********"];
    }
    if (card && name && secC && [self updateBank:card name:name partBankNum:secC bankID:cardId]) {
        _bankCardID = card;
        _bankName = name;
        _partBankCardID = secC;
        _bankCardIdentifier = cardId;
        
        [[NSNotificationCenter defaultCenter] postNotificationName:XYUserInfoDidChangedNotification object:self userInfo:nil];
    }
}

- (void)updateUserRealNameWithData:(NSDictionary *)data {
    NSString *realName = [data stringValueForKey:@"realName" default:nil];
    NSString *idCard = [data stringValueForKey:@"cardId" default:nil];
    NSString *partIdCard = [data stringValueForKey:@"hideCardId" default:nil];
    if (realName && idCard && partIdCard && [self updateCard:idCard realName:realName partCardID:partIdCard]) {
        _realName = realName;
        _cardID = idCard;
        _partCardID = partIdCard;
        
        [[NSNotificationCenter defaultCenter] postNotificationName:XYUserInfoDidChangedNotification object:self userInfo:nil];
    }
}

@end


@implementation XYUser (DBOperate)
/*
 CREATE TABLE IF NOT EXISTS user(ID integer primary key autoincrement, user_id varchar(32) NOT NULL,
 avatar varchar(32), nickname varchar(32), state integer, phone_num varchar(32), real_name varchar(32),
 part_phone_num varchar(32), api_id varchar(32), bank_num varchar(32), part_bank_num varchar(32),
 recommend_phone_num varchar(32), user_type integer, api_state integer, app_sign integer, create_time double);
 */
- (void)initDBLoginUserInDB {
    __block XYUser *user = self;
    [[XYDatabaseQueueManager shareInstance].queue inDatabase:^(FMDatabase * _Nonnull db) {
        FMResultSet *set = [db executeQuery:@"select * from user where state=?", @(XYUserStateLogin)];
        while ([set next]) {
            user.userID = [set stringForColumn:@"user_id"];
            user.nickname = [set stringForColumn:@"nickname"];
            user.phoneNumber = [set stringForColumn:@"phone_num"];
            user.realName = [set stringForColumn:@"real_name"];
            user.partPhoneNumber = [set stringForColumn:@"part_phone_num"];
            user.apiID = [set stringForColumn:@"api_id"];
            user.bankCardIdentifier = [set stringForColumn:@"bank_id"];
            user.bankName = [set stringForColumn:@"bank_name"];
            user.bankCardID = [set stringForColumn:@"bank_num"];
            user.partBankCardID = [set stringForColumn:@"part_bank_num"];
            user.cardID = [set stringForColumn:@"card_id"];
            user.partCardID = [set stringForColumn:@"part_card_id"];
            user.recommendPhoneNum = [set stringForColumn:@"recommend_phone_num"];
            user.userType = [set intForColumn:@"user_type"];
            user.apiStatus = [set intForColumn:@"api_state"];
            user.appSign = [set intForColumn:@"app_sign"];
            user.createTime = [set doubleForColumn:@"create_time"];
            user.userState = [set intForColumn:@"state"];
        }
        [set close];
    }];
}

- (BOOL)updateLoginUserInDB {
    __block BOOL success = NO;
    [[XYDatabaseQueueManager shareInstance].queue inDatabase:^(FMDatabase * _Nonnull db) {
        FMResultSet *set = [db executeQuery:@"select * from user where user_id=?", self.userID];
        if ([set next]) {
            success = [db executeUpdate:@"update user set avatar=?, nickname=?, phone_num=?, real_name=?, part_phone_num=?, api_id=?,bank_id=?, bank_name=?, bank_num=?, part_bank_num=?, card_id=?, part_card_id=?, recommend_phone_num=?, user_type=?, api_state=?, app_sign=?, create_time=?, state=?", self.avatar, self.nickname, self.phoneNumber, self.realName, self.partPhoneNumber, self.apiID, self.bankCardIdentifier, self.bankName, self.bankCardID, self.partBankCardID, self.cardID, self.partCardID, self.recommendPhoneNum, @(self.userType), @(self.apiStatus), @(self.appSign), @(self.createTime), @(self.userState)];
        } else {
            success = [db executeUpdate:@"insert or replace into user(user_id, avatar, nickname, phone_num, real_name, part_phone_num, api_id, bank_id, bank_name, bank_num, part_bank_num, card_id, part_card_id, recommend_phone_num, user_type, api_state, app_sign, create_time, state) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", self.userID, self.avatar, self.nickname, self.phoneNumber, self.realName, self.partPhoneNumber, self.apiID, self.bankCardIdentifier, self.bankName, self.bankCardID, self.partBankCardID, self.cardID, self.partCardID, self.recommendPhoneNum, @(self.userType), @(self.apiStatus), @(self.appSign), @(self.createTime), @(self.userState)];
        }
        [set close];
    }];
    return success;
}

- (BOOL)updateCard:(NSString *)cardID realName:(NSString *)realName partCardID:(NSString *)partCardID {
    __block BOOL success = NO;
    [[XYDatabaseQueueManager shareInstance].queue inDatabase:^(FMDatabase * _Nonnull db) {
        success = [db executeUpdate:@"update user set card_id=?, real_name=?, part_card_id=? where user_id=?", cardID, realName, partCardID, self.userID];
    }];
    return success;
}

- (BOOL)updateBank:(NSString *)bankNum name:(NSString *)name partBankNum:(NSString *)partBankNum bankID:(NSString *)bankID {
    __block BOOL success = NO;
    [[XYDatabaseQueueManager shareInstance].queue inDatabase:^(FMDatabase * _Nonnull db) {
        success = [db executeUpdate:@"update user set bank_num=?, bank_name=?, part_bank_num=?, bank_id=? where user_id=?", bankNum, name, partBankNum, bankID, self.userID];
    }];
    return success;
}

- (BOOL)userDidSignOut {
    __block BOOL success = NO;
    [[XYDatabaseQueueManager shareInstance].queue inDatabase:^(FMDatabase * _Nonnull db) {
        success = [db executeUpdate:@"update user set state=? where user_id=?", @(XYUserStateSignOut), self.userID];
    }];
    return success;
}

@end

