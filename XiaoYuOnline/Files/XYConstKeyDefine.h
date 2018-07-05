//
//  XYConstKeyDefine.h
//  XiaoYuOnline
//
//  Created by ChenWei on 2018/5/15.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#ifndef XYConstKeyDefine_h
#define XYConstKeyDefine_h

/// 定义 Key


#if DEBUG
#if IS_TEST
/// 测试环境

// 富友支付
#define FY_MYVERSION @"2.0"
#define FY_MCHNTCD @"0002900F0096235"
#define FY_IDTYPE @"0"
#define FY_PAYTYPE @"02"
#define FY_SIGNTP @"MD5"
#define FY_MCHNTCDKEY @"5old71wihg2tqjug9kkpxnhx9hiujoqj"
#define FY_ISTEST @YES


#else
/// 开发环境

// 富友支付
#define FY_MYVERSION @"2.0"
#define FY_MCHNTCD @"0002900F0096235"
#define FY_IDTYPE @"0"
#define FY_PAYTYPE @"02"
#define FY_SIGNTP @"MD5"
#define FY_MCHNTCDKEY @"5old71wihg2tqjug9kkpxnhx9hiujoqj"
#define FY_ISTEST @YES

#endif
#else
/// 正式环境

// 富友支付
#define FY_MYVERSION @"2.0"
#define FY_MCHNTCD @"0002900F0752956"
#define FY_IDTYPE @"0"
#define FY_PAYTYPE @"02"
#define FY_SIGNTP @"MD5"
#define FY_MCHNTCDKEY @"0spwisijatxq4qko9tm399u05ghvnimd"
#define FY_ISTEST @NO


#endif


#endif /* XYConstKeyDefine_h */
