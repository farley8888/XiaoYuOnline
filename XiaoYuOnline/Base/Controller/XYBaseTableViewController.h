//
//  XYBaseTableViewController.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/3.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XMNetworking/XMNetworking.h>

@interface XYBaseTableViewController : UITableViewController

/// 分页中的第几页
@property (nonatomic, readonly) NSInteger page;
/// 分页中的每页大小
@property (nonatomic, assign) NSInteger pageSize;
/// tableView contentInset 的调整值
@property (nonatomic, assign) UIEdgeInsets tableAdjustContentInsets;
/// 是否使用上下拉刷新，默认不显示
@property (nonatomic, assign) BOOL enablePullToRefresh;
/**
 上下拉刷新都会调用这个方法
 
 @param page 当前页
 @param isRefresh 是否是下拉刷新
 */
- (void)loadDataWithPage:(NSInteger)page isRefresh:(BOOL)isRefresh;

/**
 上下拉刷新时发送的网络请求，实际会调用父类的 sendSilentRequest:onSuccess:onFailure，但会处理分页和加载动画相关的逻辑，
 子类在调用后仅仅处理相应的列表数据就可以了。所以，子类一般情况下不要调用另一个网络请求方法
 
 @param request 请求配置 Block
 @param successBlock 成功 Block
 @return 请求标识
 */
- (NSString *)sendSilentRequest:(XMRequestConfigBlock)request onSuccess:(XMSuccessBlock)successBlock;

/**
 已加载到的数据条数。由于未能知晓业务中已加载到的数据条数，所以无法会根据这个来决定是否显示加载更多，需要子类调用并传递给父类处理
 
 @param count 数据条数
 */
- (void)didLoadDataCount:(NSInteger)count;

#pragma mark -
#pragma mark - 网络请求操作相关，之所以放在 Controller 的基类是便于管理请求的生命周期（主要是取消）
#pragma mark - 以及对请求结果（主要是失败情况）和加载过程动画进行统一显示处理。由于其中涉及的成员变量
#pragma mark - 较多，也就没有使用 Category 进行整个 UIViewController 的方法扩展

/**
 发起网络请求
 
 @param requestBlcok 请求配置 Block
 @param successBlock 成功 Block
 @param hint 成功后的提示字符
 @param failureBlock 失败的 Block
 @return 请求标识 identifier
 */
- (NSString *)sendRequest:(XMRequestConfigBlock)requestBlcok onSuccess:(XMSuccessBlock)successBlock successHint:(NSString *)hint onFailure:(XMFailureBlock)failureBlock;

/**
 发送网络请求，不处理错误（交由上层显示处理，不做自己的特殊处理），不显示 HUD（可能有自己的加载逻辑，比如上下拉刷新）
 
 @param request 请求配置 Block
 @param successBlock 成功 Block
 @param finishBlcok 完成 Blcok
 @return 请求标识 identifier
 */
- (NSString *)sendSilentRequest:(XMRequestConfigBlock)request onSuccess:(nullable XMSuccessBlock)successBlock onFinished:(XMFinishedBlock)finishBlcok;

/**
 发送网络请求，只处理正确的情况
 
 @param requestBlock 请求配置 Block
 @param show 是否显示 HUD 加载动画
 @param successBlock 成功回调
 @return 请求标识 identifier
 */
- (NSString *)sendRequest:(XMRequestConfigBlock)requestBlock showHUD:(BOOL)show onSuccess:(XMSuccessBlock)successBlock;


/**
 最为全面的网络请求
 
 @param request 请求配置 Block
 @param show 是否显示 HUD
 @param successBlock 成功 Block
 @param hint 请求成功后的提示文字
 @param failureBlock 失败的 Block，失败时默认会出现错误提示
 @param finishedBlcok 完成后的 Block
 @return 请求标识 identifier
 */
- (NSString *)sendRequest:(XMRequestConfigBlock)request showHUD:(BOOL)show onSuccess:(XMSuccessBlock)successBlock successHint:(NSString *)hint onFailure:(XMFailureBlock)failureBlock onFinished:(XMFinishedBlock)finishedBlcok;
@end
