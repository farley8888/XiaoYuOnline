//
//  XYTradeRecordViewController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/12.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "TradeRecordViewController.h"
#import "TradeDetailViewController.h"
#import "WKSegementSliderView.h"
#import "XYBillTableViewCell.h"
#import "SVPullToRefresh.h"
#import "UIView+Common.h"
#import "TradeRecoderModel.h"

static NSString *tradeRecordReuseID = @"XYBillReuseIdentifier";

@interface TradeRecordViewController ()<UITableViewDelegate, UITableViewDataSource, WKSegementSliderViewDelegate>
@property (nonatomic, strong) UIScrollView *contentScroll;
@property (nonatomic, strong) WKSegementSliderView *sliderView;
@property (nonatomic, strong) UITableView *myInvestTable;
@property (nonatomic, strong) UITableView *myLoanTable;
@property (nonatomic, strong) NSMutableArray *investList;
@property (nonatomic, strong) NSMutableArray *loanList;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;
// 上下拉刷新
@property (nonatomic, assign) NSInteger investPage;
@property (nonatomic, assign) NSInteger loanPage;
@property (nonatomic, assign) NSInteger pageSize;
@end

@implementation TradeRecordViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        _investPage = 0;
        _loanPage = 0;
        _pageSize = 20;
        _investList = [NSMutableArray array];
        _loanList = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = NSLocalizedString(@"Mine_TradeRecord", nil);
    self.view.backgroundColor = XYGlobalUI.backgroundColor;
    _dateFormatter = [[NSDateFormatter alloc] init];
    _dateFormatter.dateFormat = @"yyyy-MM-dd";
    
    NSArray *titles = @[NSLocalizedString(@"Mine_TradeRecord_MyInvest", nil),
                        NSLocalizedString(@"Mine_TradeRecord_MyLoan", nil)
                        ];
    
    _sliderView = [[WKSegementSliderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 48.0) itemTitles:titles];
    _sliderView.normalTextColor = XYGlobalUI.blackColor;
    _sliderView.selectedTextColor = XYGlobalUI.mainColor;
    _sliderView.backgroundColor = XYGlobalUI.whiteColor;
    _sliderView.delegate = self;
    [self.view addSubview:_sliderView];
    
    _contentScroll = [[UIScrollView alloc] initWithFrame:CGRectZero];
    _contentScroll.backgroundColor = XYGlobalUI.backgroundColor;
    _contentScroll.pagingEnabled = YES;
    _contentScroll.delegate = self;
    _contentScroll.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_contentScroll];
    
    _myInvestTable = [self contentTableView];
    _myLoanTable = [self contentTableView];
    [_contentScroll addSubview:_myInvestTable];
    [_contentScroll addSubview:_myLoanTable];
    
    [self loadUIContent];
}

- (UITableView *)contentTableView {
    UITableView *view = [[UITableView alloc] init];
    view.dataSource = self;
    view.delegate = self;
    view.rowHeight = 60.0;
    view.backgroundColor = XYGlobalUI.backgroundColor;
    view.separatorStyle = UITableViewCellSeparatorStyleNone;
    UINib *nib = [UINib nibWithNibName:@"XYBillTableViewCell" bundle:[NSBundle mainBundle]];
    [view registerNib:nib forCellReuseIdentifier:tradeRecordReuseID];
    
    return view;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGRect frame = _sliderView.frame;
    CGFloat bottom = 0;
    if (@available(iOS 11, *)) {
        frame.origin.y = self.view.safeAreaInsets.top;
    } else {
        frame.origin.y = self.topLayoutGuide.length;
        bottom = self.bottomLayoutGuide.length;
    }
    _sliderView.frame = frame;
    CGFloat y = CGRectGetMaxY(_sliderView.frame);
    _contentScroll.frame = CGRectMake(0, y + 8.0, self.view.width, self.view.height - y - 8.0 - bottom);
    _contentScroll.contentSize = CGSizeMake(_contentScroll.width * 2, _contentScroll.height);
    _myInvestTable.frame = CGRectMake(0, 0, _contentScroll.width, _contentScroll.height);
    _myLoanTable.frame = CGRectMake(_contentScroll.width, 0, _contentScroll.width, _contentScroll.height);
    _sliderView.signBarSize = CGSizeMake(self.view.width / 2, 4.0);
}

- (void)loadUIContent {
    [self addPullToRefreshWithTable:_myInvestTable list:_investList];
    [self addPullToRefreshWithTable:_myLoanTable list:_loanList];
    [self loadTableData:_myInvestTable list:_investList isRefresh:YES];
    [self loadTableData:_myLoanTable list:_loanList isRefresh:YES];
}

- (void)addPullToRefreshWithTable:(UITableView *)table list:(NSMutableArray *)list{
    __weak typeof(self) weakSelf = self;
    __weak typeof(table) weakTable = table;
    __weak typeof(list) weakList = list;
    [table addPullToRefreshWithActionHandler:^{
        if (table == weakSelf.myInvestTable) {
            weakSelf.investPage = 0;
        } else {
            weakSelf.loanPage = 0;
        }
        [weakSelf loadTableData:weakTable list:weakList isRefresh:YES];
    }];
    [table addInfiniteScrollingWithActionHandler:^{
        [weakSelf loadTableData:weakTable list:weakList isRefresh:NO];
    }];
    
    table.showsInfiniteScrolling = NO;
    table.pullToRefreshView.arrowColor = XYGlobalUI.blackColor;
    table.pullToRefreshView.textColor = XYGlobalUI.blackColor;
    [table.pullToRefreshView setTitle:@"下拉刷新" forState:SVPullToRefreshStateStopped];
    [table.pullToRefreshView setTitle:@"松开更新" forState:SVPullToRefreshStateTriggered];
    [table.pullToRefreshView setTitle:@"加载中..." forState:SVPullToRefreshStateLoading];
}

- (void)loadTableData:(UITableView *)table list:(NSMutableArray *)list isRefresh:(BOOL)isRefresh {
    __weak typeof(self) weakSelf = self;
    BOOL isInvest = (_sliderView.selectedIndex == 0);
    NSNumber *type;
    NSNumber *pageN;
    if (isInvest) {
        type = @(1); // 我的投资
        pageN = @(weakSelf.investPage);
    } else {
        type = @(2); // 我的借款
        pageN = @(weakSelf.loanPage);
    }
    
    [self sendSilentRequest:^(XMRequest * _Nonnull request) {
        request.httpMethod = kXMHTTPMethodGET;
        request.api = Mine_TradeRecord_URL;
        request.parameters = @{@"userId" : XYCurrentUser.userID,
                               @"type" : type,
                               @"page" : pageN,
                               @"size" : @(weakSelf.pageSize)
                               };
    } onSuccess:^(id  _Nullable responseObject) {
        NSMutableArray *marr = [NSMutableArray arrayWithCapacity:20];
        for (NSDictionary *data in responseObject[@"list"]) {
            TradeRecoderModel *model = [[TradeRecoderModel alloc] initWithMyInvestListApi:data];
            [marr addObject:model];
        }
        
        if (isRefresh) {
            [list removeAllObjects];
        }
        table.showsInfiniteScrolling = marr.count >= 20;
        [list addObjectsFromArray:marr];
        [table reloadData];
        if (isRefresh) {
            [table.pullToRefreshView stopAnimating];
        } else {
            [table.infiniteScrollingView stopAnimating];
        }
        isInvest ? weakSelf.investPage ++ : weakSelf.loanPage ++;
    } onFinished:^(id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            [table.pullToRefreshView stopAnimating];
            [table.infiniteScrollingView stopAnimating];
        }
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_sliderView.selectedIndex == 0) {
        return _investList.count;
    } else {
        return _loanList.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TradeRecoderModel *model;
    if (_sliderView.selectedIndex == 0) {
        model = _investList[indexPath.row];
    } else {
        model = _loanList[indexPath.row];
    }
    XYBillTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tradeRecordReuseID forIndexPath:indexPath];
    cell.valueLabel.textColor = XYGlobalUI.grayColor;
    cell.leftBottomLabel.textColor = XYGlobalUI.blackColor;
    cell.rightBottomLabel.textColor = XYGlobalUI.redColor;
    cell.titleLabel.text = model.title;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:model.createTime];
    cell.valueLabel.text = [_dateFormatter stringFromDate:date];
    cell.leftBottomLabel.text = [NSString stringWithFormat:@"%@ %@元", model.useReason, model.account];
    cell.rightBottomLabel.text = @"等待还款";
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TradeRecoderModel *model;
    if (_sliderView.selectedIndex == 0) {
        model = _investList[indexPath.row];
    } else {
        model = _loanList[indexPath.row];
    }
    TradeDetailViewController *vc = [[TradeDetailViewController alloc] initWithTradeModel:model];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -
#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == _contentScroll) {
        CGPoint offset = scrollView.contentOffset;
        NSInteger index = (NSInteger)(offset.x / scrollView.width);
        [_sliderView setSelectedIndex:index animate:YES];
    }
}

#pragma mark -
#pragma mark - WKSegementSliderViewDelegate

- (void)sliderSegementBar:(WKSegementSliderView *)bar didSeletedItemAtIndex:(NSUInteger)index forward:(BOOL)isForward {
    CGPoint offset = CGPointMake(index * _contentScroll.width, 0);
    [_contentScroll setContentOffset:offset animated:YES];
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
