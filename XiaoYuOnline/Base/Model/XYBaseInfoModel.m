//
//  XYBaseInfoModel.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/5.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYBaseInfoModel.h"

@interface XYBaseInfoModel()
@property (nonatomic, copy) NSString *title;
@end

@implementation XYBaseInfoModel

- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content description:(NSString *)description {
    self = [super init];
    if (self) {
        _title = title;
        _content = content;
        _scriptDescription = description;
    }
    return self;
}

@end
