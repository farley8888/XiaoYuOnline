//
//  XYURLDefine.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/24.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#ifndef XYURLDefine_h
#define XYURLDefine_h

/**
 切换开发和测试环境
 */
#define IS_TEST 1

// 定义 BaseURL
#if DEBUG
#if IS_TEST
// 测试环境
#define XYBaseURL @"http://ios.xiaoyuzx.cn:85/"
#else
// 开发环境
#define XYBaseURL @"http://test.xiaoyuzx.cn/"

#endif
#else
// 正式环境
#define XYBaseURL @"http://ios.xiaoyuzx.cn:85/"
#endif

/**
 用户账户相关
 */
// 登录
#define Account_LoginURL @"ios/user/doLogin.html"
// 短信验证码
#define Account_SendVerifyCodeURL @"ios/user/sendMessage.html";
// 快捷登录
#define Account_LoginFastURL @"ios/user/doJKLogin.html"
// 注册
#define Account_Register @"ios/user/doNewRegister.html"
// 退出登录
#define Account_SiginOutURL @"/ios/user/logout.html"

/**
 首页
 */
// 首页
#define HomePage_URL @"ios/index.html"
// 站内公告
#define HomePage_Notice_URL @"ios/article/detail2.html"
// 我要投资
#define HomePage_Invest_URL @"ios/invest/detail_main2.html"
// 立即投资
#define HomePage_InvestNow_URL @"ios/member/security/hfInitiativeTender.html"
// 签到
#define HomePage_Sigin_URL @"ios/user/sign/saveSign.html"
// 借款
#define HomePage_Borrow_URL @"ios/borrowBespeak/doBespeak.html"
// 预约标的
#define HomePage_PlanBid_URL @"ios/borrowBespeak/savereservation.html"
// 签到
#define HomePage_Sign_URL @"ios/sign/getSignDate.html"

/**
 我的
 */
// 我的资产
#define Mine_Assets_URL @"ios/member/account/myAccount.html"
// 我的账单
#define Mine_Bill_List_URL @"ios/member/account/account_list.html"
// 交易记录
#define Mine_TradeRecord_URL @"ios/member/invest/myInvest.html"
// 实名认证
#define Mine_RealName_URL @"ios/hf/callback/userRegisterAyns.html"
// 绑定银行卡
#define Mine_BindCard_URL @"ios/member/security/hfUserBindCard.html"
// 充值
#define Mine_Charge_URL @"ios/member/recharge/doNewRecharge.html"
// 充值回调
#define Mine_Charge_CallBack_URL @"ios/hf/callback/netSaveAyns.html"
// 提现
#define Mine_Withdraw_URL @"ios/member/security/hfCash.html"
// 卡包
#define Mine_CardBag_URL @"ios/member/welfare/myprofit.html"
// 修改密码
#define Mine_ChangePssword_URL @"ios/user/doResetPwd.html"
// 修改交易密码
#define Mine_ChangeTradePassowrd_URL @"/ios/user/doResetPayPwd.html"
// 积分商城
#define Mine_ScoreShop_URL @"ios/mall/queryMallProduct.html"

/**
 发现
 */
// 首页列表
#define Discovery_List_URL @"ios/index/findListByPage.html"
// 发现详情
#define Discovery_Detail_URL @"ios/article/detail2.html"
// 理财 URL
#define ManageMoney_List_URL @"ios/invest/invest_list.html"


#endif /* XYURLDefine_h */
