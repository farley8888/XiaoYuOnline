//
//  UIImage+Common.h
//  TataProject
//
//  Created by Lala on 15/9/17.
//  Copyright (c) 2015年 Lala. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Common)

/**
 *  将图片按指定角度旋转
 *
 *  @param degrees 角度
 *
 *  @return 旋转后的图片
 */
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;

/**
 *  自动兼容图片的方向
 *
 *  @return 旋转后的图片
 */
- (UIImage *)fixOrientation;

/**
 *  将图片压缩至固定长宽范围内
 *
 *  @param newSize 长宽范围
 *  @param quality 图片压缩质量
 *
 *  @return 压缩后的图片
 */
- (UIImage *)resizedImage:(CGSize)newSize interpolationQuality:(CGInterpolationQuality)quality;

/**
 创建某个颜色的图片

 @param color 颜色
 @param size 大小
 @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 生成缩略图

 @param asize 大小
 @return 缩略图
 */
- (UIImage *)thumbnailWithSize:(CGSize)asize;

/**
 给图片添加圆角

 @param radius 圆角半径
 @return 带圆角的图片
 */
- (UIImage *)imageByRoundCornerRadius:(CGFloat)radius;

/**
 给图片添加圆角及描边

 @param radius 圆角半径
 @param borderWidth 描边线宽
 @param borderColor 描边线的颜色
 @return 带圆角及描边的图片
 */
- (UIImage *)imageByRoundCornerRadius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

@end

