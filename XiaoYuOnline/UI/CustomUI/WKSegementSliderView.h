//
//  WKSegementSliderView.h
//  Wookong
//
//  Created by wei.chen on 2018/2/27.
//  Copyright © 2018年 meta-insight.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WKSegementSliderView;
@protocol WKSegementSliderViewDelegate<NSObject>

- (void)sliderSegementBar:(WKSegementSliderView *)bar didSeletedItemAtIndex:(NSUInteger)index forward:(BOOL)isForward;

@end

@interface WKSegementSliderView : UIView

/// 普通状态时文字颜色， 默认灰色
@property (nonatomic, strong) UIColor *normalTextColor;
/// 默认文字，16 号
@property (nonatomic, strong) UIFont *normalFont;
/// 选中状态文字， 默认蓝色
@property (nonatomic, strong) UIColor *selectedTextColor;
/// 选中文字，16 号
@property (nonatomic, strong) UIFont *selectedFont;
/// 指示条颜色， 默认与选中文字颜色一致
@property (nonatomic, strong) UIColor *signBarColor;
/// 指示条尺寸
@property (nonatomic, assign) CGSize signBarSize;
/// 选中的 Index
@property (nonatomic, assign) NSUInteger selectedIndex;

@property (nonatomic, weak) id<WKSegementSliderViewDelegate> delegate;

/**
 使用指示条标题进行初始化
 
 @param frame frame
 @param titles 标题数组
 @return 实例
 */
- (instancetype)initWithFrame:(CGRect)frame itemTitles:(NSArray<NSString *> *)titles;

- (void)setSelectedIndex:(NSUInteger)index animate:(BOOL)animate;

@end
