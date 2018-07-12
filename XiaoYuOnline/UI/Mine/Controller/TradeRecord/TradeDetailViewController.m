//
//  TradeDetailViewController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/13.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "TradeDetailViewController.h"
#import "RepaymentController.h"
#import "XYTradeDetailViewCell.h"
#import "PhoneCodeVerifyView.h"
#import "XYTradeDetailModel.h"
#import "TradeRecoderModel.h"

static NSString *tradeDetaiReuseID = @"XYTradeDetailReuseIdentifier";

@interface TradeDetailViewController ()
@property (nonatomic, strong) NSArray <XYTradeDetailModel *> *itemList;
@property (nonatomic, assign) BOOL adjustContentInset;
@property (nonatomic, strong) TradeRecoderModel *model;
@end

@implementation TradeDetailViewController

- (instancetype)initWithTradeModel:(TradeRecoderModel *)model {
    self = [super init];
    if (self) {
        _model = model;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Mine_TradeRecord_Bid_Title", nil);
    _itemList = [XYTradeDetailModel tradeDatasourceListWithTradeModel:_model];
    
    self.tableView.tableHeaderView = [self tableHeaderView];
    self.tableView.tableFooterView = [self tableFooterView];
    self.tableView.rowHeight = 48.0;
    self.tableView.backgroundColor = XYGlobalUI.backgroundColor;
    [self.tableView registerClass:[XYTradeDetailViewCell class] forCellReuseIdentifier:tradeDetaiReuseID];
}

- (UIView *)tableHeaderView {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 95)];
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = XYGlobalUI.lineColor;
    headerView.backgroundColor = XYGlobalUI.whiteColor;
    UILabel *title = [[UILabel alloc] init];
    title.textAlignment = NSTextAlignmentCenter;
    UILabel *des = [[UILabel alloc] init];
    des.font = XYGlobalUI.smallFont_12;
    des.textAlignment = NSTextAlignmentCenter;
    [headerView addSubview:title];
    [headerView addSubview:des];
    [headerView addSubview:lineView];
    title.text = _model.totalMoney;
    des.text = @"应付本息";
    
    [@[title, des] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headerView).offset(20);
        make.right.equalTo(headerView).offset(-20);
    }];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headerView).offset(35.0);
    }];
    [des mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(title.mas_bottom).offset(5.0);
    }];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(headerView);
        make.height.equalTo(@(XYGlobalUI.singleLineWidth));
    }];
    
    return headerView;
}

- (UIView *)tableFooterView {
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
    footerView.backgroundColor = XYGlobalUI.backgroundColor;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:XYGlobalUI.whiteColor forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(commitButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:NSLocalizedString(@"Mine_TradeRecord_Bid_Repayment", nil) forState:UIControlStateNormal];
    UIImage *img = [[UIImage imageNamed:@"main_btn_50diameter_bg"] stretchableImageWithLeftCapWidth:25 topCapHeight:25];
    [btn setBackgroundImage:img forState:UIControlStateNormal];
    [footerView addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(footerView);
        make.top.equalTo(footerView).offset(20);
        make.size.mas_equalTo(CGSizeMake(260.0, 50.0));
    }];
    
    return footerView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    if (!_adjustContentInset) {
        UIEdgeInsets edge = self.tableView.contentInset;
        edge.top += 8.0;
        self.tableView.contentInset = edge;
        _adjustContentInset = YES;
        self.tableView.contentOffset = CGPointMake(0, -8.0);
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _itemList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XYTradeDetailViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tradeDetaiReuseID forIndexPath:indexPath];
    XYTradeDetailModel *model = _itemList[indexPath.row];
    cell.titleLabel.text = model.title;
    cell.descriptionLabel.text = model.content;
    if (model.isSpecial) {
        cell.descriptionLabel.textColor = XYGlobalUI.redColor;
    } else {
        cell.descriptionLabel.textColor = XYGlobalUI.blackColor;
    }
    
    return cell;
}

#pragma mark -
#pragma mark - EventResponse

- (void)commitButtonAction:(UIButton *)button {
    RepaymentController *vc = [[RepaymentController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
