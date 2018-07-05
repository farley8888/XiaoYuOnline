//
//  XYDatabaseQueueManager.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/25.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB/FMDB.h>

@interface XYDatabaseQueueManager : NSObject

@property (nonatomic, readonly) FMDatabaseQueue *queue;
@property (nonatomic, readonly) NSString *databasePath;
+ (XYDatabaseQueueManager *)shareInstance;
- (instancetype)init NS_UNAVAILABLE;

@end
