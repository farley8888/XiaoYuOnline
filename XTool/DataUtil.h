//
//  DataUtil.h
//  XiaoYuOnline
//
//  Created by apple on 2018/7/11.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const FToolUserDidSaveARecordNotification = @"FToolUserDidSaveARecordNotification";
@class FAccountCategaries, FCurrentMonthRecord;

@interface DataUtil : NSObject

@property (nonatomic,strong) FAccountCategaries *aFAccountCategaries;

@property (nonatomic,strong) FCurrentMonthRecord *currentMonthRecord;

+(void) setResult:(BOOL) pass;
+(BOOL) isPass;

- (void)generatePlist;
- (void)generateMonthBlance;

@end
