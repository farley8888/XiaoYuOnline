//
//  XYTradeDetailModel.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/13.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "BaseInfoModel.h"

@class TradeRecoderModel;
@interface XYTradeDetailModel : BaseInfoModel

/**
 是否是特殊显示（特殊显示为红色）
 */
@property (nonatomic, assign) BOOL isSpecial;
+ (NSArray<XYTradeDetailModel *> *)tradeDatasourceListWithTradeModel:(TradeRecoderModel *)model;

@end
