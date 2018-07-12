//
//  XYSystemDefine.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/3.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#ifndef OLSystemDefine_h
#define OLSystemDefine_h

/**
 * TabBar 高度
 */
#define XYTabBarHeight ((self.tabBarController.tabBar&&!self.tabBarController.tabBar.hidden)?self.tabBarController.tabBar.height:0)

/**
 * 导航栏高度
 */
#define XYNavBarHeight ((self.navigationController.navigationBar&&!self.navigationController.navigationBar.hidden)?self.navigationController.navigationBar.height:0)

/**
 * 状态栏高度
 */
#define XYStatusBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height)

/**
 *  主屏的宽
 */
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

/**
 *  主屏的高
 */
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

/**
 *  主屏的size
 */
#define SCREEN_SIZE   [[UIScreen mainScreen] bounds].size

/**
 *  主屏的frame
 */
#define SCREEN_FRAME  CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)

/**
 系统版本比较
 */
#define XYSYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define XYSYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define XYSYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define XYSYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define XYSYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


/**
 *    生成RGB颜色
 *
 *    @param     red     red值（0~255）
 *    @param     green     green值（0~255）
 *    @param     blue     blue值（0~255）
 *
 *    @return    UIColor对象
 */
#define RGB_COLOR(r, g, b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

/**
 *    生成RGBA颜色
 *
 *    @param     red     red值（0~255）
 *    @param     green     green值（0~255）
 *    @param     blue     blue值（0~255）
 *    @param     alpha     blue值（0~1）
 *
 *    @return    UIColor对象
 */
#define RGBA_COLOR(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#endif /* XYSystemDefine_h */
