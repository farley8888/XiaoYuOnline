//
//  XYPreferentialModel.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/5/12.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 优惠券

 - XYPreferentialTypeBonus: 红包
 - XYPreferentialTypeCashTicket: 现金券
 - XYPreferentialTypeProfitTicket: 加息券
 */
typedef NS_ENUM(NSInteger, XYPreferentialType) {
    XYPreferentialTypeBonus,
    XYPreferentialTypeCashTicket,
    XYPreferentialTypeProfitTicket
};

/**
 优惠 Model
 */
@interface PreferentialModel : NSObject

@property (nonatomic, copy) NSString *preferentialID;
@property (nonatomic, copy) NSString *module;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *unit;
@property (nonatomic, copy) NSString *usableMoney;
@property (nonatomic, copy) NSString *value;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSTimeInterval obtainTime;
@property (nonatomic, assign) XYPreferentialType type;

- (instancetype)initWithApiData:(NSDictionary *)data;

@end
