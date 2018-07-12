//
//  OLGlobalUIConfig.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/5.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define XYGlobalUI [OLGlobalUIConfig shareInstance]

@interface OLGlobalUIConfig : NSObject
/**
 全局 UI 单例
 */
+ (instancetype)shareInstance;

#pragma mark - 文字
/**
 18 号标题
 */
@property (nonatomic, readonly) UIFont *titleFont;

/**
 16 号正文
 */
@property (nonatomic, readonly) UIFont *mainFont;

/**
 16 号正文(加粗)
 */
@property (nonatomic, readonly) UIFont *mainBoldFont;

/**
 14 号小字
 */
@property (nonatomic, readonly) UIFont *smallFont_14;

/**
 14 号小字（加粗)
 */
@property (nonatomic, readonly) UIFont *smallBoldFont_14;

/**
 12 号小字
 */
@property (nonatomic, readonly) UIFont *smallFont_12;

/**
 12 号小字 (加粗)
 */
@property (nonatomic, readonly) UIFont *smallBoldFont_12;

/**
 9 号小字
 */
@property (nonatomic, readonly) UIFont *smallFont_9;

#pragma mark - 颜色
/**
 主色调，橙色
 */
@property (nonatomic, readonly) UIColor *mainColor;

/**
 黄色
 */
@property (nonatomic, readonly) UIColor *yellowColor;

/**
 黑色 e.g 标题／选项／正文
 */
@property (nonatomic, readonly) UIColor *blackColor;

/**
 浅黑色，RGB（58， 58， 58）
 */
@property (nonatomic, readonly) UIColor *lightBlcakColor;

/**
 白色 e.g 标题／选项／正文
 */
@property (nonatomic, readonly) UIColor *whiteColor;

/**
 灰色 e.g 次要文字
 */
@property (nonatomic, readonly) UIColor *grayColor;

/**
 浅灰色 e.g 输入框边框
 */
@property (nonatomic, readonly) UIColor *lightGrayColor;

/**
 白灰色 e.g 卡片边框／分割线
 */
@property (nonatomic, readonly) UIColor *lineColor;

/**
 绿色 e.g 完成状态／下滑状态
 */
@property (nonatomic, readonly) UIColor *greenColor;
@property (nonatomic, readonly) UIColor *blueColor;

/**
 红色 e.g 警示状态／上升状态
 */
@property (nonatomic, readonly) UIColor *redColor;

/**
 浅色背景 e.g 浅色背景／添加图片按钮背景／选项选中背景／子问题背景
 */
@property (nonatomic, readonly) UIColor *backgroundColor;

/**
 屏幕 size
 */
@property (nonatomic, assign, readonly) CGSize screenSize;

/**
 黄色按钮背景图片
 */
@property (nonatomic, readonly) UIImage *yellowButtonBackgroundImage;

/**
 1 像素线的宽度
 */
@property (nonatomic, assign, readonly) CGFloat singleLineWidth;

- (UIImage *)stretchCorner5ImageWithName:(NSString *)name;

@end
