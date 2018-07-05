//
//  XYCardBagViewController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/6.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYCardBagViewController.h"
#import "WKSegementSliderView.h"
#import "SVPullToRefresh.h"
#import "XYCardBagViewCell.h"
#import "UIView+Common.h"
#import "XYCardBagModel.h"

static NSString *cardBagReuseID = @"XYCardBagCellReuseIdentifier";

@interface XYCardBagViewController ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate, WKSegementSliderViewDelegate>
@property (nonatomic, strong) WKSegementSliderView *sliderView;
@property (nonatomic, strong) UIScrollView *contentScroll;
@property (nonatomic, assign) NSInteger pageSize;
@property (nonatomic, assign) NSInteger bonusPage;
@property (nonatomic, strong) NSMutableArray *bonusList;
@property (nonatomic, strong) UITableView *bonusTableView;
@property (nonatomic, assign) NSInteger vouncherPage;
@property (nonatomic, strong) NSMutableArray *vouncherList;
@property (nonatomic, strong) NSArray<NSMutableArray *> *allDataList;
@property (nonatomic, strong) UITableView *vouncherTableView;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@end

@implementation XYCardBagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _pageSize = 20;
    _bonusList = [NSMutableArray array];
    _vouncherList = [NSMutableArray array];
    _allDataList = @[_bonusList, _vouncherList];
    _dateFormatter = [[NSDateFormatter alloc] init];
    _dateFormatter.dateFormat = @"yyyy-MM-dd";
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = NSLocalizedString(@"Mine_Setting_WB_CardBag", nil);
    
    NSArray *titles = @[NSLocalizedString(@"Mine_Setting_WB_CB_Bonus", nil),
                        NSLocalizedString(@"Mine_Setting_WB_CB_Voucher", nil)
                        ];
    _sliderView = [[WKSegementSliderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 48.0) itemTitles:titles];
    _sliderView.normalTextColor = XYGlobalUI.blackColor;
    _sliderView.selectedTextColor = XYGlobalUI.mainColor;
    _sliderView.delegate = self;
    [self.view addSubview:_sliderView];
    
    _contentScroll = [[UIScrollView alloc] initWithFrame:CGRectZero];
    _contentScroll.backgroundColor = XYGlobalUI.backgroundColor;
    _contentScroll.pagingEnabled = YES;
    _contentScroll.delegate = self;
    [self.view addSubview:_contentScroll];
    
    _bonusTableView = [self contentTableView];
    _vouncherTableView = [self contentTableView];
    [_contentScroll addSubview:_bonusTableView];
    [_contentScroll addSubview:_vouncherTableView];
    [self addPullToRefreshWithTable:_bonusTableView list:_bonusList];
    [self addPullToRefreshWithTable:_vouncherTableView list:_vouncherList];
}

- (UITableView *)contentTableView {
    UITableView *view = [[UITableView alloc] init];
    view.dataSource = self;
    view.delegate = self;
    view.rowHeight = 120.0;
    view.backgroundColor = XYGlobalUI.backgroundColor;
    view.separatorStyle = UITableViewCellSeparatorStyleNone;
    [view registerClass:[XYCardBagViewCell class] forCellReuseIdentifier:cardBagReuseID];
    
    return view;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGRect frame = _sliderView.frame;
    UIEdgeInsets edge = UIEdgeInsetsMake(7.0, 0, 0, 0);
    if (@available(iOS 11, *)) {
        frame.origin.y = self.view.safeAreaInsets.top;
        edge.bottom = self.view.safeAreaInsets.bottom;
    } else {
        frame.origin.y = self.topLayoutGuide.length;
    }
    _sliderView.frame = frame;
    CGFloat y = CGRectGetMaxY(_sliderView.frame);
    _contentScroll.frame = CGRectMake(0, y, self.view.width, self.view.height - y);
    
    NSArray *tables = @[_bonusTableView, _vouncherTableView];
    for (NSUInteger i = 0, count = tables.count; i < count; i ++) {
        UITableView *view = tables[i];
        view.contentInset = edge;
        view.frame = CGRectMake(i * _contentScroll.width, 0, _contentScroll.width, _contentScroll.height);
    }
    
    _contentScroll.contentSize = CGSizeMake(_contentScroll.width * tables.count, _contentScroll.height);
    _sliderView.signBarSize = CGSizeMake(self.view.width / 3.0, 4.0);
    
    [_bonusTableView triggerPullToRefresh];
    [_vouncherTableView triggerPullToRefresh];
}

- (void)addPullToRefreshWithTable:(UITableView *)table list:(NSMutableArray *)list{
    __weak typeof(self) weakSelf = self;
    __weak typeof(table) weakTable = table;
    __weak typeof(list) weakList = list;
    [table addPullToRefreshWithActionHandler:^{
        if (table == weakSelf.bonusTableView) {
            weakSelf.bonusPage = 0;
        } else if(table == weakSelf.vouncherTableView) {
            weakSelf.vouncherPage = 0;
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
    NSArray<NSNumber *> *pages = @[@(_bonusPage), @(_vouncherPage)];
    NSNumber *type = _sliderView.selectedIndex == 0 ? @(121438) : @(121446);
    NSNumber *size = @(_pageSize);
    NSNumber *page = pages[_sliderView.selectedIndex];
    
    [self sendSilentRequest:^(XMRequest * _Nonnull request) {
        request.httpMethod = kXMHTTPMethodGET;
        request.api = Mine_CardBag_URL;
        request.parameters = @{@"userId" : !XYCurrentUser.userID ? @"" : XYCurrentUser.userID,
                               @"usestatus" : @(-1),
                               @"ticketType" : type,
                               @"page" : page,
                               @"size" : size
                               };
    } onSuccess:^(id  _Nullable responseObject) {
        NSMutableArray *marr = [NSMutableArray arrayWithCapacity:weakSelf.pageSize];
        for (NSDictionary *data in responseObject[@"welfare"]) {
            XYCardBagModel *model = [[XYCardBagModel alloc] initWithApiData:data];
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
        
        if (table == weakSelf.bonusTableView) {
            weakSelf.bonusPage ++;
        } else if(table == weakSelf.vouncherTableView) {
            weakSelf.vouncherPage ++;
        }
    } onFinished:^(id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            [table.pullToRefreshView stopAnimating];
            [table.infiniteScrollingView stopAnimating];
        }
    }];
}

#pragma mark - UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _allDataList[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XYCardBagModel *model = _allDataList[indexPath.section][indexPath.row];
    XYCardBagViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cardBagReuseID forIndexPath:indexPath];
    cell.valueLabel.text = [@"¥ " stringByAppendingString:model.value];
    cell.usageConditionLabel.text = [NSString stringWithFormat:@"满 %@ 使用", model.useableMoney];
    cell.validDateLabel.text = [NSString stringWithFormat:@"有效期至：%@", [_dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:model.validDate]]];
    
    UIImage *imgLeft;
    UIImage *imgRight;
    UIImage *imgSel;
    UIColor *textColor;
    NSString *usageString;
    
    if (model.isValid) {
        if (model.isUsed) {
            textColor = XYGlobalUI.whiteColor;
            cell.canUseImageView.hidden = NO;
            if (tableView == _bonusTableView) {
                imgSel = [UIImage imageNamed:@"mine_wb_voucher_sel_blue"];
            } else if (tableView == _vouncherTableView) {
                imgSel = [UIImage imageNamed:@"mine_wb_voucher_sel_red"];
            } else {
                imgSel = [UIImage imageNamed:@"mine_wb_voucher_sel_yellow"];
            }
            
            imgLeft = [UIImage imageNamed:@"mine_wb_left_gray"];
            imgRight = [UIImage imageNamed:@"mine_wb_voucher_used"];
            usageString = @"已使用";
        } else {
            cell.canUseImageView.hidden = YES;
            if (tableView == _bonusTableView) {
                imgLeft = [UIImage imageNamed:@"mine_wb_left_blue"];
            } else if (tableView == _vouncherTableView) {
                imgLeft = [UIImage imageNamed:@"mine_wb_left_red"];
            } else {
                imgLeft = [UIImage imageNamed:@"mine_wb_left_yellow"];
            }
            imgRight = [UIImage imageNamed:@"mine_wb_voucher_nouse"];
            usageString = @"未使用";
            textColor = XYGlobalUI.blackColor;
        }
    } else {
        textColor = XYGlobalUI.whiteColor;
        cell.canUseImageView.hidden = YES;
        imgLeft = [UIImage imageNamed:@"mine_wb_left_gray"];
        imgRight = [UIImage imageNamed:@"mine_wb_voucher_used"];
        usageString = @"已过期";
    }
    
    cell.usageSateLabel.textColor = textColor;
    cell.canUseImageView.image = imgSel;
    cell.usageSateLabel.text = usageString;
    cell.backgroundImageView.image = [imgLeft resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 50, 50) resizingMode:UIImageResizingModeStretch];
    cell.usableTagView.image = [imgRight stretchableImageWithLeftCapWidth:5 topCapHeight:5];
    
    return cell;
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
