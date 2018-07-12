//
//  XYRealNameModel.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/5.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "BaseInfoModel.h"

@interface XYRealNameModel : BaseInfoModel

@property (nonatomic, copy) NSString *placeHolder;

- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content description:(NSString *)description placeHolder:(NSString *)placeHolder;

+ (NSArray <XYRealNameModel *> *)realNameDatasourceList;
+ (NSArray <XYRealNameModel *> *)bindBankCardDatasourceList;

@end
