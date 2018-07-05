//
//  XYTradeRecoderModel.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/5/9.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYTradeRecoderModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *account;
@property (nonatomic, copy) NSString *bidNumber;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *useReason;
@property (nonatomic, copy) NSString *yearRatio;
@property (nonatomic, copy) NSString *totalMoney;
@property (nonatomic, assign) NSTimeInterval createTime;

- (instancetype)initWithMyInvestListApi:(NSDictionary *)data;

@end
