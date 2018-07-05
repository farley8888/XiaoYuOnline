//
//  XYManageMoneyViewController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/3.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYManageMoneyViewController.h"
#import "XYBidDetailViewController.h"
#import "SVPullToRefresh.h"
#import "XYManageMoneyCell.h"
#import "WKSegementSliderView.h"
#import "NSString+Common.h"
#import "UIView+Common.h"
#import "XYManageMoneyModel.h"
#import "XYBidModel.h"

static NSString *manageMoneyReuseID = @"XYManageMoneyCellReuseIdentifier";

@interface XYTriggerTableView : UITableView
// 下拉刷新是否触发过
@property (nonatomic, assign) BOOL refreshTriggered;
@property (nonatomic, strong) NSDate *lastRefreshDate;
@end

@implementation XYTriggerTableView
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        _lastRefreshDate = [NSDate dateWithTimeIntervalSince1970:0];
    }
    return self;
}
@end

@interface XYManageMoneyViewController ()<UITableViewDelegate, UITableViewDataSource, WKSegementSliderViewDelegate, XYManageMoneyCellDelegate>
@property (nonatomic, strong) UIScrollView *contentScroll;
@property (nonatomic, strong) WKSegementSliderView *sliderView;
@property (nonatomic, strong) XYTriggerTableView *totalTable;
@property (nonatomic, assign) NSInteger totalTablePage;
@property (nonatomic, strong) NSMutableArray *totalDataList;
@property (nonatomic, strong) XYTriggerTableView *greenHandTable;
@property (nonatomic, assign) NSInteger greenHandPage;
@property (nonatomic, strong) NSMutableArray *greenDataList;
@property (nonatomic, strong) XYTriggerTableView *customTable;
@property (nonatomic, assign) NSInteger customPage;
@property (nonatomic, strong) NSMutableArray *customDataList;
@property (nonatomic, strong) XYTriggerTableView *companyTable;
@property (nonatomic, assign) NSInteger companyPage;
@property (nonatomic, strong) NSMutableArray *companyDataList;
@property (nonatomic, assign) BOOL hasLoadAllTables;
@property (nonatomic, weak) XYTriggerTableView *lastTableView;

@end

@implementation XYManageMoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = NSLocalizedString(@"ManageMoney_Title", nil);
    self.view.backgroundColor = XYGlobalUI.backgroundColor;
    _totalDataList = [NSMutableArray array];
    _greenDataList = [NSMutableArray array];
    _customDataList = [NSMutableArray array];
    _companyDataList = [NSMutableArray array];
    
    NSArray *titles = @[NSLocalizedString(@"ManageMoney_Total", nil),
                        NSLocalizedString(@"ManageMoney_New", nil),
                        NSLocalizedString(@"ManageMoney_Custom", nil),
                        NSLocalizedString(@"ManageMoney_Company", nil)
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
    
    _totalTable = [self contentTableView];
    _totalTable.refreshTriggered = YES;
    [_contentScroll addSubview:_totalTable];
    [self addPullToRefreshWithTable:_totalTable list:_totalDataList];
}

- (XYTriggerTableView *)contentTableView {
    XYTriggerTableView *view = [[XYTriggerTableView alloc] init];
    view.dataSource = self;
    view.delegate = self;
    view.rowHeight = 160.0;
    view.backgroundColor = XYGlobalUI.backgroundColor;
    view.separatorStyle = UITableViewCellSeparatorStyleNone;
    [view registerClass:[XYManageMoneyCell class] forCellReuseIdentifier:manageMoneyReuseID];
    
    return view;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self configSubviewFrames];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // 在 ViewDidLoad 中初始化全部 Table 时会耗费过多，导致首屏加载过慢
    // 所以先让第一屏幕显示出来，然后再加载后续的 TableView
    if (!_hasLoadAllTables) {
        [self.totalTable triggerPullToRefresh];
        
        _greenHandTable = [self contentTableView];
        _customTable = [self contentTableView];
        _companyTable = [self contentTableView];
        [_contentScroll addSubview:_greenHandTable];
        [_contentScroll addSubview:_customTable];
        [_contentScroll addSubview:_companyTable];
        
        NSArray *tables = @[_greenHandTable, _customTable, _companyTable];
        NSArray<NSMutableArray *> * datasources = @[_greenDataList, _customDataList, _companyDataList];
        for (NSUInteger i = 0, count = tables.count; i < count; i ++) {
            XYTriggerTableView *view = tables[i];
            view.frame = CGRectMake((i+1) * _contentScroll.width, 0, _contentScroll.width, _contentScroll.height);
            [self addPullToRefreshWithTable:view list:datasources[i]];
        }
        _hasLoadAllTables = YES;
    }
}

- (void)configSubviewFrames {
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
    _contentScroll.contentSize = CGSizeMake(_contentScroll.width * 4, _contentScroll.height);
    _totalTable.frame = CGRectMake(0, 0, _contentScroll.width, _contentScroll.height);
    _sliderView.signBarSize = CGSizeMake(self.view.width / 3.0, 4.0);
}

- (void)addPullToRefreshWithTable:(XYTriggerTableView *)table list:(NSMutableArray *)list{
    __weak typeof(self) weakSelf = self;
    __weak typeof(table) weakTable = table;
    __weak typeof(list) weakList = list;
    [table addPullToRefreshWithActionHandler:^{
        if (table == weakSelf.totalTable) {
            weakSelf.totalTablePage = 0;
        } else if(table == weakSelf.greenHandTable) {
            weakSelf.greenHandPage = 0;
        } else if(table == weakSelf.customTable) {
            weakSelf.customPage = 0;
        } else if(table == weakSelf.companyTable) {
            weakSelf.companyPage = 0;
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

- (void)loadTableData:(XYTriggerTableView *)table list:(NSMutableArray *)list isRefresh:(BOOL)isRefresh {
    NSTimeInterval last = [table.lastRefreshDate timeIntervalSince1970];
    NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
    if (now - last > 2.0) { // 限流
        __weak typeof(self) weakSelf = self;
        NSArray<NSNumber *> *pages = @[@(_totalTablePage), @(_greenHandPage), @(_customPage), @(_companyPage)];
        NSNumber *type, *isNo, *size = @(20);
        NSNumber *page = pages[_sliderView.selectedIndex];
        
        if (table == weakSelf.totalTable) {
            type = @(0);
            isNo = @(-1);
        } else if(table == weakSelf.greenHandTable) {
            type = @(0);
            isNo = @(1);
        } else if(table == weakSelf.customTable) {
            type = @(0);
            isNo = @(0);
        } else if(table == weakSelf.companyTable) {
            type = @(3);
            isNo = @(-1);
        }
        
        [self sendSilentRequest:^(XMRequest * _Nonnull request) {
            request.httpMethod = kXMHTTPMethodGET;
            request.api = ManageMoney_List_URL;
            request.parameters = @{@"userId" : !XYCurrentUser.userID ? @"" : XYCurrentUser.userID,
                                   @"isNovice" : isNo,
                                   @"type" : type,
                                   @"page" : page,
                                   @"size" : size
                                   };
        } onSuccess:^(id  _Nullable responseObject) {
            NSMutableArray *marr = [NSMutableArray arrayWithCapacity:20];
            for (NSDictionary *data in responseObject[@"data"][@"list"]) {
                XYManageMoneyModel *model = [[XYManageMoneyModel alloc] initWithManageMoneyListApi:data];
                [marr addObject:model];
            }
            
            if (isRefresh) {
                [list removeAllObjects];
                [table.pullToRefreshView stopAnimating];
            } else {
                [table.infiniteScrollingView stopAnimating];
            }
            table.showsInfiniteScrolling = marr.count >= 20;
            [list addObjectsFromArray:marr];
            [table reloadData];
            
            if (table == weakSelf.totalTable) {
                weakSelf.totalTablePage ++;
            } else if(table == weakSelf.greenHandTable) {
                weakSelf.greenHandPage ++;
            } else if(table == weakSelf.customTable) {
                weakSelf.customPage ++;
            } else if(table == weakSelf.companyTable) {
                weakSelf.companyPage ++;
            }
        } onFinished:^(id  _Nullable responseObject, NSError * _Nullable error) {
            if (error) {
                [table.pullToRefreshView stopAnimating];
                [table.infiniteScrollingView stopAnimating];
            }
        }];
    } else {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [table.pullToRefreshView stopAnimating];
            [table.infiniteScrollingView stopAnimating];
        });
    }
    
    table.lastRefreshDate = [NSDate date];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == _totalTable) {
        return _totalDataList.count;
    } else if(tableView == _greenHandTable) {
        return _greenDataList.count;
    } else if(tableView == _customTable) {
        return _customDataList.count;
    } else if(tableView == _companyTable) {
        return _companyDataList.count;
    } else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XYManageMoneyModel *model = nil;
    if (tableView == _totalTable) {
        if (_totalDataList.count >= indexPath.row) {
            model = _totalDataList[indexPath.row];
        }
    } else if(tableView == _greenHandTable) {
        if (_greenDataList.count >= indexPath.row) {
            model = _greenDataList[indexPath.row];
        }
    } else if(tableView == _customTable) {
        if (_customDataList.count >= indexPath.row) {
            model = _customDataList[indexPath.row];
        }
    } else if(tableView == _companyTable) {
        if (_companyDataList.count >= indexPath.row) {
            model = _companyDataList[indexPath.row];
        }
    }
    
    XYManageMoneyCell *cell = [tableView dequeueReusableCellWithIdentifier:manageMoneyReuseID forIndexPath:indexPath];
    cell.titleLabel.text = model.title;
    cell.progressView.progress = model.investProgress;
    cell.deadlineLabel.attributedText = model.planLimitMonthAtt;
    cell.profitLabel.attributedText = model.yearProfitRatioAtt;
    cell.surplusLabel.attributedText = model.investableVolumeAtt;
    cell.progressLabel.text = model.progressString;
    cell.delegate = self;
    cell.freshImageView.hidden = !model.isNovice;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSArray<NSMutableArray *> * datasources = @[_totalDataList, _greenDataList, _customDataList, _companyDataList];
    XYManageMoneyModel *model = datasources[_sliderView.selectedIndex][indexPath.row];
    XYBidDetailViewController *vc = [[XYBidDetailViewController alloc] initWithBidModel:model];
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
        [self triggeredPullToRefreshWithIndex:index];
    }
}

#pragma mark -
#pragma mark - WKSegementSliderViewDelegate

- (void)sliderSegementBar:(WKSegementSliderView *)bar didSeletedItemAtIndex:(NSUInteger)index forward:(BOOL)isForward {
    CGPoint offset = CGPointMake(index * _contentScroll.width, 0);
    [_contentScroll setContentOffset:offset animated:YES];
    [self triggeredPullToRefreshWithIndex:index];
}


#pragma mark -
#pragma mark - XYManageMoneyCellDelegate

- (void)manageMoneyCell:(XYManageMoneyCell *)cell didPressedBuyButton:(UIButton *)button {
    NSArray *tables = @[_totalTable, _greenHandTable, _customTable, _companyTable];
    UITableView *table = tables[_sliderView.selectedIndex];
    NSIndexPath *index = [table indexPathForCell:cell];
    [self tableView:table didSelectRowAtIndexPath:index];
}

- (void)triggeredPullToRefreshWithIndex:(NSUInteger)index {
    if (index > 0) {
        XYTriggerTableView *table = @[_totalTable, _greenHandTable, _customTable, _companyTable][index];
        if (!table.refreshTriggered) {
            [table triggerPullToRefresh];
            table.refreshTriggered = YES;
        }
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
