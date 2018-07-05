//
//  XYBidDetailViewController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/10.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYBidDetailViewController.h"
#import "XYInvestViewController.h"
#import "XYLoginViewController.h"
#import "XYBidSecondViewCell.h"
#import "XYBidFirstViewCell.h"
#import "XYBidThirdViewCell.h"
#import "XYBidModel.h"

static NSString *bidFirstReuseID = @"XYBidFirstCellReuseIdentifier";
static NSString *bidSecondReuseID = @"XYBidSecondCellReuseIdentifier";
static NSString *bidThirdReuseID = @"XYBidThirdCellReuseIdentifier";

@interface XYBidDetailViewController ()
@property (nonatomic, strong) NSArray <NSString *> *secondSectionList;
@property (nonatomic, copy) NSString *introString;
@property (nonatomic, strong) XYBidModel *model;
@end

@implementation XYBidDetailViewController

- (instancetype)initWithBidModel:(XYBidModel *)bidModel {
    self = [super init];
    if (self) {
        _model = bidModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"ManageMoney_BidDetail", nil);
    
    _secondSectionList = @[[@"剩余时间：" stringByAppendingString:_model.restTime],
                           [@"还款方式：" stringByAppendingString:_model.repaymentString],
                           [@"预期计划期限：" stringByAppendingFormat:@"%@ 个月", _model.planLimitMonth]
                           ];
    _introString = _model.content;
    
    self.tableView.sectionHeaderHeight = 8.0;
    self.tableView.backgroundColor = XYGlobalUI.backgroundColor;
    [self.tableView registerClass:[XYBidFirstViewCell class] forCellReuseIdentifier:bidFirstReuseID];
    [self.tableView registerClass:[XYBidSecondViewCell class] forCellReuseIdentifier:bidSecondReuseID];
    [self.tableView registerClass:[XYBidThirdViewCell class] forCellReuseIdentifier:bidThirdReuseID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 165;
    } else if (indexPath.section == 1) {
        return 42.0;
    } else {
        return [XYBidThirdViewCell cellHeightWithContent:_introString];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return _secondSectionList.count;
    } else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *desCell;
    if (indexPath.section == 0) {
        XYBidFirstViewCell *cell = [tableView dequeueReusableCellWithIdentifier:bidFirstReuseID forIndexPath:indexPath];
        [cell.actionButton addTarget:self action:@selector(investButtonAction) forControlEvents:UIControlEventTouchUpInside];
        cell.titleLabel.text = _model.title;
        cell.progressView.progress = _model.investProgress;
        cell.deadlineLabel.attributedText = _model.planLimitMonthAtt;
        cell.profitLabel.attributedText = _model.yearProfitRatioAtt;
        cell.surplusLabel.attributedText = _model.planTotalAtt;
        cell.progressLabel.text = _model.progressString;
        cell.addInterestLabel.text = @"加息券";
        cell.cashVoucherLabel.text = @"现金券";
        cell.surplusRaiseLabel.text = [@"剩余融资金额" stringByAppendingString:_model.planTotal];
        cell.freshImageView.hidden = !_model.isNovice;
        
        desCell = cell;
    } else if (indexPath.section == 1) {
        XYBidSecondViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:bidSecondReuseID forIndexPath:indexPath];
        cell1.textLabel.font = XYGlobalUI.smallFont_12;
        cell1.textLabel.text = _secondSectionList[indexPath.row];
        
        desCell = cell1;
    } else {
        XYBidThirdViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:bidThirdReuseID forIndexPath:indexPath];
        cell2.contentLabel.text = _introString;
        
        desCell = cell2;
    }
    
    return desCell;
}

- (void)investButtonAction {
    if (XYCurrentUser.userState == XYUserStateLogin) {
        XYInvestViewController *vc= [[XYInvestViewController alloc] initWithBidId:_model.bidID];
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        XYLoginViewController *login = [[XYLoginViewController alloc] init];
        [self.navigationController pushViewController:login animated:YES];
    }
}

@end
