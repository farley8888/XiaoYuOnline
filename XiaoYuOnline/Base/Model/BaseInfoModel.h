//
//  XYBaseInfoModel.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/5.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseInfoModel : NSObject

@property (nonatomic, readonly) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *scriptDescription;
@property (nonatomic, assign, getter=isEditable) BOOL editable;

- (instancetype)initWithTitle:(nullable NSString *)title content:(nullable NSString *)content description:(nullable NSString *)description;

@end
