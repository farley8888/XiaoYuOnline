//
//  NSString+Common.h
//  LesTa
//
//  Created by Well on 15/3/3.
//  Copyright (c) 2015年 William. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@interface NSString (Common)

/**
 *  过滤html特殊字符
 *
 *  @return 过滤后的string
 */
- (NSString *)ignoreHTMLSpecialString;

/**
 *  对自己进行md5加密
 *
 *  @return 加密后的string
 */
- (NSString *)md5;

/**
 *  对自己进行sha1加密
 *
 *  @return 加密后的string
 */
- (NSString *)sha1;

/**
 *  验证是否是邮箱地址
 *
 *  @return YES：是邮箱地址
 */
- (BOOL)isEmail;

/**
 *  验证是否是手机号码
 *
 *  @return YES：是手机号码
 */
- (BOOL)isMobile;

/**
 *  获取年龄
 *
 *  @return 年龄
 */
- (NSString *)age;

/*********** StringSize **********/

/// 限制 Size 的某段 font 格式下文本宽高
- (CGSize)stringSizeWithFont:(UIFont *)font restrictWidth:(CGFloat)width restrictHeight:(CGFloat)height;

/// 限制宽度下某段文本高度
- (CGFloat)stringHeightWithFont:(UIFont *)font restrictWidth:(CGFloat)width;
- (CGFloat)stringHeightWithAttribute:(NSDictionary *)attribute restrictWidth:(CGFloat)width;

/// 限制高度下的文本宽度
- (CGFloat)stringWidthWithFont:(UIFont *)font restrictHeight:(CGFloat)height;
- (CGFloat)stringWidthWithAttribute:(NSDictionary *)attribute restrictHeight:(CGFloat)height;

/******** AttributeString *******/
- (NSDictionary *)attributeWithFont:(UIFont *)font color:(UIColor *)color lineSpace:(CGFloat)lineSpace;

@end


@interface NSString (NetworkEncryption)
/// 获取App版本号
+ (NSString *)appVersion;
@end
