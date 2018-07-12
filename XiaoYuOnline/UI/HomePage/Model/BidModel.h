//
//  XYBidModel.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/27.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, XYBidStatus) {
    XYBidStatusBuyNow,  // 立即抢购
    XYBidStatusSellOut, // 已售完
    XYBidStatusSelling, // 履约中
    XYBidStatusFinished // 结束
};

typedef NS_ENUM(NSInteger, XYRepaymentType) {
    XYRepaymentTypeMonth = 1,      // 按月分期还款
    XYRepaymentTypeSingle,     // 一次性还款
    XYRepaymentTypeMontyProfit // 每月还息到期还本
};

@interface BidModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *bidID;
@property (nonatomic, copy) NSString *awardMoney;
@property (nonatomic, copy) NSString *bidNumber;
@property (nonatomic, copy) NSString *yearProfitRatio;
@property (nonatomic, copy) NSString *planLimitMonth;
@property (nonatomic, copy) NSString *planTotal;
@property (nonatomic, copy) NSString *investableVolume;
@property (nonatomic, copy) NSString *progressString;
@property (nonatomic, copy) NSString *restTime;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, assign) float investProgress;
@property (nonatomic, assign) XYBidStatus status;
@property (nonatomic, copy) NSString *statusText;
@property (nonatomic, assign) XYRepaymentType reapymentType;
@property (nonatomic, assign) NSString *repaymentString;

@property (nonatomic, copy) NSAttributedString *yearProfitRatioAtt;
@property (nonatomic, copy) NSAttributedString *planLimitMonthAtt;
@property (nonatomic, copy) NSAttributedString *planTotalAtt;
@property (nonatomic, copy) NSAttributedString *investableVolumeAtt;
@property (nonatomic, assign) BOOL isNovice;

- (instancetype)initWithHomePageListApi:(NSDictionary *)data;

@end
