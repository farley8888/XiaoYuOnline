//
//  XYDatabaseQueueManager.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/25.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "DatabaseQueueManager.h"
#import "OLURLDefine.h"
#import "DatabaseQueueManager+Infrate.h"

@implementation DatabaseQueueManager {
    NSString *_dbPath;
}

+ (DatabaseQueueManager *)shareInstance {
    static DatabaseQueueManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] initWithDatabasePath:[self dbPath]];
    });
    return manager;
}

- (instancetype)initWithDatabasePath:(NSString *)path {
    self = [super init];
    if (self) {
        _databasePath = path;
        NSFileManager *fileManage = [NSFileManager defaultManager];
        NSString *directory = [path stringByDeletingLastPathComponent];
        BOOL isDir = YES;
        if (![fileManage fileExistsAtPath:directory isDirectory:&isDir]) {
            [fileManage createDirectoryAtPath:directory withIntermediateDirectories:YES attributes:nil error:NULL];
        }
        
        _queue = [[FMDatabaseQueue alloc] initWithPath:_databasePath];
        [_queue inDatabase:^(FMDatabase * _Nonnull db) {
            [db setShouldCacheStatements:YES];
        }];
        // 用户表
        [self createUserTable];
    }
    return self;
}

+ (NSString *) dbPath{
    NSString *homeDir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
#if DEBUG
#if IS_TEST
    // 测试环境
    return [homeDir stringByAppendingPathComponent:@"XYDatabase/xiaoyu_test.sqlite"];
#else
    // 开发环境
    return [homeDir stringByAppendingPathComponent:@"XYDatabase/xiaoyu_dev.sqlite"];
#endif
#else
    // 正式环境
    return [homeDir stringByAppendingPathComponent:@"XYDatabase/xiaoyu.sqlite"];
#endif
}

- (void)createUserTable {
    /*
     @property (nonatomic, copy) NSString *userID;
     @property (nonatomic, copy) NSString *nickname;
     @property (nonatomic, copy) NSString *realName;
     @property (nonatomic, copy) NSString *phoneNumber;
     @property (nonatomic, copy) NSString *partPhoneNumber;
     @property (nonatomic, copy) NSString *apiID;
     @property (nonatomic, copy) NSString *bankCardID;
     @property (nonatomic, copy) NSString *partBankCardID;
     @property (nonatomic, copy) NSString *recommendPhoneNum;
     @property (nonatomic, assign) int userType;
     @property (nonatomic, assign) NSTimeInterval createTime;
     @property (nonatomic, assign) int apiStatus;
     @property (nonatomic, assign) BOOL appSign;
     @property (nonatomic, assign) OLUserState userState;
     */
    NSString *statements = @"CREATE TABLE IF NOT EXISTS user(ID integer primary key autoincrement, user_id varchar(32) NOT NULL, avatar varchar(32), nickname varchar(32), state integer, phone_num varchar(32), real_name varchar(32), part_phone_num varchar(32), api_id varchar(32), bank_id varchar(32), bank_name varchar(32), bank_num varchar(32), part_bank_num varchar(32), card_id varchar(32), part_card_id varchar(32), recommend_phone_num varchar(32), user_type integer, api_state integer, app_sign integer, create_time double);";
    
    [_queue inDatabase:^(FMDatabase * _Nonnull db) {
        if (![db executeStatements:statements]) {
            [db executeStatements:statements];
        }
    }];
}

@end
