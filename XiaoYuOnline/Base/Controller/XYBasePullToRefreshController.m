//
//  XYBasePullToRefreshController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/27.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYBasePullToRefreshController.h"
#import "SVPullToRefresh.h"

@interface XYBasePullToRefreshController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) BOOL viewAppeared;
@end

@implementation XYBasePullToRefreshController

- (instancetype)init {
    self = [super init];
    if (self) {
        _page = 0;
        _pageSize = 20;
        _tableStyle = UITableViewStylePlain;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:_tableStyle];
    _tableView.dataSource = self;
    _tableView.backgroundColor = XYGlobalUI.backgroundColor;
    _tableView.delegate = self;
    self.tableView.rowHeight = 44.0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    // 添加上下拉刷新
    __weak typeof(self) weakSelf = self;
    [_tableView addPullToRefreshWithActionHandler:^{
        weakSelf.page = 0;
        [weakSelf loadDataWithPage:weakSelf.page isRefresh:YES];
    }];
    [_tableView addInfiniteScrollingWithActionHandler:^{
        [weakSelf loadDataWithPage:weakSelf.page isRefresh:NO];
    }];
    
    _tableView.showsInfiniteScrolling = NO;
    _tableView.pullToRefreshView.arrowColor = XYGlobalUI.blackColor;
    _tableView.pullToRefreshView.textColor = XYGlobalUI.blackColor;
    [_tableView.pullToRefreshView setTitle:@"下拉刷新" forState:SVPullToRefreshStateStopped];
    [_tableView.pullToRefreshView setTitle:@"松开更新" forState:SVPullToRefreshStateTriggered];
    [_tableView.pullToRefreshView setTitle:@"加载中..." forState:SVPullToRefreshStateLoading];
}

- (void)loadDataWithPage:(NSInteger)page isRefresh:(BOOL)isRefresh {
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (NSString *)sendSilentRequest:(XMRequestConfigBlock)request onSuccess:(XMSuccessBlock)successBlock {
    __weak typeof(self) weakSelf = self;
    return [super sendSilentRequest:request onSuccess:successBlock onFinished:^(id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            [weakSelf didLoadDataCount:0];
        }
    }];
}

- (void)didLoadDataCount:(NSInteger)count {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.tableView.showsPullToRefresh &&
            (self.tableView.pullToRefreshView.state == SVPullToRefreshStateLoading)) {
            [self.tableView.pullToRefreshView stopAnimating];
        }
        
        if (self.tableView.showsInfiniteScrolling &&
            (self.tableView.infiniteScrollingView.state == SVInfiniteScrollingStateLoading)) {
            [self.tableView.infiniteScrollingView stopAnimating];
        }
    });
    
    if (count >= self.pageSize) {
        _page ++;
        _tableView.showsInfiniteScrolling = YES;
    } else {
        _tableView.showsInfiniteScrolling = NO;
    }
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    if (!_viewAppeared) {
        UIEdgeInsets inset =_tableView.contentInset;
        inset.top += _tableAdjustContentInsets.top;
        inset.left += _tableAdjustContentInsets.left;
        inset.bottom += _tableAdjustContentInsets.bottom;
        inset.right += _tableAdjustContentInsets.right;
        _tableView.contentInset = inset;
        
        _tableView.pullToRefreshView.originalTopInset = inset.top;
        _tableView.infiniteScrollingView.originalBottomInset = inset.bottom;
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (!_viewAppeared) {
        [self.tableView triggerPullToRefresh];
        _viewAppeared = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
