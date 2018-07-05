//
//  XYScoreShopViewController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/7.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYScoreShopViewController.h"
#import "XYSocreShopHeader.h"
#import "XYScoreShopTableViewCell.h"
#import <YYKit/NSDictionary+YYAdd.h>
#import "SVPullToRefresh.h"
#import "XYScoreModel.h"

static NSString *shopCovertHeaderReuseID = @"XYShopCovertHeaderReuseIdentifier";
static NSString *couponConvertHeaderReuseID = @"XYCouponCovertHeaderReuseIdentifier";
static NSString *shopCovertCellReuseID = @"XYShopCovertCellReuseIdentifier";
static NSString *couponConvertCellReuseID = @"XYCouponCovertCellReuseIdentifier";

@interface XYScoreShopViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *scoreList;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger pageSize;
@property (nonatomic, strong) NSNumber *totalScore;
@property (nonatomic, copy) NSString *currentScore;
@property (nonatomic, assign) BOOL loadedSubViews;
@end

@implementation XYScoreShopViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        _page = 0;
        _pageSize = 20;
        _scoreList = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = XYGlobalUI.backgroundColor;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    [_tableView registerClass:[XYScoreShopTableViewCell class] forCellReuseIdentifier:shopCovertCellReuseID];
    [_tableView registerClass:[XYCouponConvertViewCell class] forCellReuseIdentifier:couponConvertCellReuseID];
    [_tableView registerClass:[XYSocreShopHeader class] forHeaderFooterViewReuseIdentifier:shopCovertHeaderReuseID];
    [_tableView registerClass:[XYCouponConvertHeader class] forHeaderFooterViewReuseIdentifier:couponConvertHeaderReuseID];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH * 0.53)];
    imgView.image = [UIImage imageNamed:@"mine_wb_scoreShop"];
    _tableView.tableHeaderView = imgView;
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.equalTo(self.view);
        make.top.equalTo(self.view).offset([[UIApplication sharedApplication] statusBarFrame].size.height);
        if (@available(iOS 11, *)) {            
            self.additionalSafeAreaInsets = UIEdgeInsetsMake(-44.0, 0, 0, 0);
        }
    }];
    
    __weak typeof(self) weakSelf = self;
    [self.tableView addPullToRefreshWithActionHandler:^{
        weakSelf.page = 1;
        [weakSelf loadTableDataRefresh:YES];
    }];
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        [weakSelf loadTableDataRefresh:NO];
    }];
    
    self.tableView.showsInfiniteScrolling = NO;
    self.tableView.pullToRefreshView.arrowColor = XYGlobalUI.blackColor;
    self.tableView.pullToRefreshView.textColor = XYGlobalUI.blackColor;
    [self.tableView.pullToRefreshView setTitle:@"下拉刷新" forState:SVPullToRefreshStateStopped];
    [self.tableView.pullToRefreshView setTitle:@"松开更新" forState:SVPullToRefreshStateTriggered];
    [self.tableView.pullToRefreshView setTitle:@"加载中..." forState:SVPullToRefreshStateLoading];
}

- (void)loadTableDataRefresh:(BOOL)isRefresh {
    __weak typeof(self)weakSelf = self;
    
    [self sendSilentRequest:^(XMRequest * _Nonnull request) {
        request.api = Mine_ScoreShop_URL;
        request.parameters = @{@"userId" : XYCurrentUser.userID,
                               @"page" : @(weakSelf.page),
                               @"size" : @(weakSelf.pageSize)
                               };
    } onSuccess:^(id  _Nullable responseObject) {
        NSMutableArray *marr = [NSMutableArray array];
        weakSelf.totalScore = responseObject[@"validScore"];
        for (NSDictionary *data in responseObject[@"cash"][@"pro"]) {
            XYScoreModel *model = [[XYScoreModel alloc] initWithScoreShopListData:data];
            [marr addObject:model];
        }
        if (isRefresh) {
            [weakSelf.scoreList removeAllObjects];
        }
        [weakSelf.scoreList addObjectsFromArray:marr];
        [weakSelf.tableView reloadData];
        [weakSelf didLoadDataCount:marr.count];
    } onFinished:^(id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            [weakSelf didLoadDataCount:0];
        }
    }];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    if (!_loadedSubViews) {
        UIEdgeInsets inset =_tableView.contentInset;
        _tableView.pullToRefreshView.originalTopInset = inset.top;
        _tableView.infiniteScrollingView.originalBottomInset = inset.bottom;
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (!_loadedSubViews) {
        [_tableView triggerPullToRefresh];
        _loadedSubViews = YES;
    }
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

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return _scoreList.count;
    } else {
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 78.0;
    } else {
        return 92.0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 150.0;
    } else {
        return 124.0;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UITableViewHeaderFooterView *view;
    if (section == 0) {
        XYCouponConvertHeader *view1 = [tableView dequeueReusableHeaderFooterViewWithIdentifier:couponConvertHeaderReuseID];
        view1.titleLabel.text = @"代金券兑换";
        view1.titleImageView.image = [UIImage imageNamed:@"mine_wb_cb_voucher"];
        view1.descriptionLabel.text = [NSString stringWithFormat:@"当前积分：%@", !self.totalScore ? @"" : self.totalScore];
        
        view = view1;
    } else {
        XYSocreShopHeader *view2 = [tableView dequeueReusableHeaderFooterViewWithIdentifier:shopCovertHeaderReuseID];
        view2.titleLabel.text = @"商品兑换";
        view2.titleImageView.image = [UIImage imageNamed:@"mine_wb_cb_goods"];
        view = view2;
    }
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    if (indexPath.section == 0) {
        XYScoreModel *model = _scoreList[indexPath.row];
        XYCouponConvertViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:couponConvertCellReuseID forIndexPath:indexPath];
        // 以下数据只是为了方便展示 UI 的测试数据
        UIImage *img;
        NSString *vl = [NSString stringWithFormat:@"¥%@", model.cashValue];
        NSInteger v = model.cashValue.integerValue;
        if (v < 100) {
            img = [UIImage imageNamed:@"mine_wb_card_green"];
        } else if (v < 200) {
            img = [UIImage imageNamed:@"mine_wb_card_red"];
        } else {
            img = [UIImage imageNamed:@"mine_wb_card_yellow"];
        }
        cell1.valueLabel.text = vl;
        cell1.titleImageView.image = [img resizableImageWithCapInsets:UIEdgeInsetsMake(30, 4, 30, 4) resizingMode:UIImageResizingModeStretch];
        cell1.titleLable.text = [NSString stringWithFormat:@"%@ 元代金券", vl];
        cell1.contentLabel.text = [NSString stringWithFormat:@"%@ 天后到期", @(model.validDate)];
        cell1.descriptionLabel.text = [NSString stringWithFormat:@"%@ 积分", model.score];
        cell1.rightButton.enabled = _totalScore.integerValue >= model.score.integerValue;
        
        cell = cell1;
    } else {
        XYScoreShopTableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:shopCovertCellReuseID forIndexPath:indexPath];
        cell2.titleLable.text = @"充电宝";
        cell2.contentLabel.text = @"1888积分兑换";
        cell2.titleImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"mine_wb_cb_test%@", @(indexPath.row)]];
        
        cell = cell2;
    }
    
    return cell;
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
