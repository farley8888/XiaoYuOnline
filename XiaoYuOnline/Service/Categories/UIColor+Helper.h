//
//  UIColor+Helper.h
//  NiuDing
//
//  Created by WilliamChen on 17/4/21.
//  Copyright © 2017年 WilliamChen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Helper)

/**
 返回 Hex 字符类型的颜色

 @param hexStr @"0xF0F", @"66ccff", @"#66CCFF88"
 @return UIColor
 */
+ (instancetype)colorWithHexString:(NSString *)hexStr;
@end
