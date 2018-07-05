//
//  XYPickerView.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/16.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "SheetPresentStyleView.h"

@interface XYPickerView : SheetPresentStyleView

@property (nonatomic, copy, nullable) NSString *seletedValue;

/**
 首页详情下拉等选择器
 
 @param datasource 选择器的 datasource
 @param completionBlock 完成后的回调
 @return 实例
 */
- (nullable instancetype)initWithPickerDataSource:(nonnull NSArray <NSString *> *)datasource completionBlock:(void(^ _Nullable)( NSString * _Nonnull selectedValue))completionBlock;

@end
