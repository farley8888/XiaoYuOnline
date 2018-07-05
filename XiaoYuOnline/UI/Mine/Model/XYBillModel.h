//
//  XYBillModel.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/4.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, XYBillStatus) {
    XYBillStatusSuccess,
    XYBillStatusInReview,
    XYBillStatusFailure
};

@interface XYBillModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *moneyDisp;
@property (nonatomic, copy) NSString *remark;
@property (nonatomic, assign) NSTimeInterval addTime;
@property (nonatomic, assign) XYBillStatus status;

- (instancetype)initWithBillListApiData:(NSDictionary *)data;

@end
