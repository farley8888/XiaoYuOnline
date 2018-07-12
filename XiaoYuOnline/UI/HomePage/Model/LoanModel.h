//
//  LoanModel.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/12.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "BaseInfoModel.h"

@interface LoanModel : BaseInfoModel

@property (nonatomic, copy) NSString *placeHolder;
@property (nonatomic, strong) NSArray *sheetTitles;
@property (nonatomic, strong) NSNumber *selectedIndex;

- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content description:(NSString *)description placeHolder:(NSString *)placeHolder;

+ (NSArray<NSArray<LoanModel *> *> *)loanDatasourceList;

@end