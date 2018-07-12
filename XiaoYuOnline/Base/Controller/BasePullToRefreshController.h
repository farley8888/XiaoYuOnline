//
//  XYBasePullToRefreshController.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/27.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "BaseViewController.h"

@interface BasePullToRefreshController : BaseViewController
/// 分页中的第几页
@property (nonatomic, readonly) NSInteger page;
/// 分页中的每页大小
@property (nonatomic, assign) NSInteger pageSize;
/// TableView
@property (nonatomic, readonly) UITableView *tableView;
/// tableView contentInset 的调整值
@property (nonatomic, assign) UIEdgeInsets tableAdjustContentInsets;
/// table 的样式
@property (nonatomic, assign) UITableViewStyle tableStyle;
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

@end
