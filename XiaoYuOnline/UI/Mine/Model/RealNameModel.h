//
//  RealNameModel.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/5.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "BaseInfoModel.h"

@interface RealNameModel : BaseInfoModel

@property (nonatomic, copy) NSString *placeHolder;

- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content description:(NSString *)description placeHolder:(NSString *)placeHolder;

+ (NSArray <RealNameModel *> *)realNameDatasourceList;
+ (NSArray <RealNameModel *> *)bindBankCardDatasourceList;

@end
