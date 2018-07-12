//
//  HomePageViewController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/3.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "HomePageViewController+Custeffet.h"
#import "BidDetailViewController.h"
#import "PlanBidViewController.h"
#import "InviteFrinendController.h"
#import "UIViewController+ShowTextHUD.h"
#import "LoginViewController.h"
#import "LoanViewController.h"
#import "HomeFirstViewCell.h"
#import "HomeSecondViewCell.h"
#import "HomeSectionHeader.h"
#import "HomeThirdViewCell.h"
#import <YYKit/NSDictionary+YYAdd.h>
#import "HomeSignView.h"
#import "BidModel.h"

static NSString *homeFirstReuseID = @"XYHomeFirstCellReuseIdentifier";
static NSString *homeSecondReuseID = @"XYHomeSecondCellReuseIdentifier";
static NSString *homeThirdReuseID = @"XYHomeThirdCellReuseIdentifier";
static NSString *homeHeaderReuseID = @"XYHomeHeaderReuseIdentifier";

@interface HomePageViewController ()<UITableViewDelegate, UITableViewDataSource, XYHomeFirstCellDelegate, XYHomeThirdViewCellDelegate, XYHomeSignViewDelegate>
@property (nonatomic, strong) NSMutableArray<BidModel *> *todayRecommend;
@end

@implementation HomePageViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tableStyle = UITableViewStyleGrouped;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = nil;
    _todayRecommend = [NSMutableArray array];
    self.tabBarItem.title = NSLocalizedString(@"HomePage_Title", nil);
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.tableView.sectionFooterHeight = 0;
    
    UIView *header = [UIView new];
    header.frame = CGRectMake(0, 0, SCREEN_WIDTH, 0.1);
    self.tableView.tableHeaderView = header;
    
    [self.tableView registerClass:[HomeFirstViewCell class] forCellReuseIdentifier:homeFirstReuseID];
    [self.tableView registerClass:[HomeSecondViewCell class] forCellReuseIdentifier:homeSecondReuseID];
    [self.tableView registerClass:[HomeThirdViewCell class] forCellReuseIdentifier:homeThirdReuseID];
    [self.tableView registerClass:[HomeSectionHeader class] forHeaderFooterViewReuseIdentifier:homeHeaderReuseID];
}

- (void)loadDataWithPage:(NSInteger)page isRefresh:(BOOL)isRefresh {
    __weak typeof(self)weakSelf = self;
    [self sendSilentRequest:^(XMRequest * _Nonnull request) {
        request.api = HomePage_URL;
        request.parameters = @{@"page" : @(weakSelf.page),
                               @"size" : @(weakSelf.pageSize)
                               };
        request.httpMethod = kXMHTTPMethodGET;
    } onSuccess:^(id  _Nullable responseObject) {
        NSMutableArray *marr = [NSMutableArray array];
        for (NSDictionary * data in responseObject[@"list"][@"list"]) {
            BidModel *bid = [[BidModel alloc] initWithHomePageListApi:data];
            [marr addObject:bid];
        }
        if (isRefresh) {
            [weakSelf.todayRecommend removeAllObjects];
        }
        [weakSelf.todayRecommend addObjectsFromArray:marr];
        [weakSelf didLoadDataCount:marr.count];
        [weakSelf.tableView reloadData];
    }];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    if (@available(iOS 11, *)) {
        CGFloat statusBarH = [UIApplication sharedApplication].statusBarFrame.size.height;
        CGFloat navBarH = self.navigationController.navigationBar.frame.size.height;
        if (statusBarH > 20) {
            self.tableView.contentInset = UIEdgeInsetsMake(- navBarH, 0, 0, 0);
        } else {
            self.tableView.contentInset = UIEdgeInsetsMake(- (statusBarH + navBarH), 0, 0, 0);
        }
    } else {
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, self.bottomLayoutGuide.length, 0);
    }
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return nil;
    } else {
        HomeSectionHeader *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:homeHeaderReuseID];
        if (section == 1) {
            header.titleImageView.image = [UIImage imageNamed:@"home_crown_bg"];
            header.titleLabel.text = NSLocalizedString(@"HomePage_NewHand", nil);
        } else {
            header.titleImageView.image = [UIImage imageNamed:@"home_digg_btn"];
            header.titleLabel.text = NSLocalizedString(@"HomePage_TodayRecommend", nil);
        }
        return header;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return [HomeFirstViewCell cellHeight];
    } else if(indexPath.section == 1) {
        return [HomeSecondViewCell cellHeight];
    } else {
        return 164.0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    } else {
        return 48.0;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 2) {
        return _todayRecommend.count;
    } else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *desCell = nil;
    if (indexPath.section == 0) {
        HomeFirstViewCell *cell0 = [tableView dequeueReusableCellWithIdentifier:homeFirstReuseID forIndexPath:indexPath];
        cell0.delegate = self;
        desCell = cell0;
    } else if (indexPath.section == 1) {
        HomeSecondViewCell *cell = [tableView dequeueReusableCellWithIdentifier:homeSecondReuseID forIndexPath:indexPath];
        cell.imageView.image = [UIImage imageNamed:@"Home_second_cell"];
        
        desCell = cell;
    } else {
        BidModel *model = _todayRecommend[indexPath.row];
        HomeThirdViewCell *cell = [tableView dequeueReusableCellWithIdentifier:homeThirdReuseID forIndexPath:indexPath];
        cell.profitImageView.image = [UIImage imageNamed:@"home_profit_bg"];
        cell.voucherImageView.image = [UIImage imageNamed:@"home_voucher_bg"];
        cell.previousYearProfit.attributedText = model.yearProfitRatioAtt;
        cell.planTimeLabel.attributedText = model.planLimitMonthAtt;
        cell.planTotalLabel.attributedText = model.planTotalAtt;
        cell.investableLabel.attributedText = model.investableVolumeAtt;
        cell.progressView.progress = model.investProgress;
        cell.progressLabel.text = model.progressString;
        cell.delegate = self;
        
        int v = indexPath.row % 3;
        if (v == 0) {
            cell.addProfitImageView.image = [UIImage imageNamed:@"home_addProfit_red_bg"];
            cell.leftVerticalView.backgroundColor = XYGlobalUI.redColor;
        } else if (v == 1) {
            cell.addProfitImageView.image = [UIImage imageNamed:@"home_addProfit_blue_bg"];
            cell.leftVerticalView.backgroundColor = XYGlobalUI.blueColor;
        } else if (v == 2) {
            cell.addProfitImageView.image = [UIImage imageNamed:@"home_addProfit_yellow_bg"];
            cell.leftVerticalView.backgroundColor = XYGlobalUI.yellowColor;
        }
        
        desCell = cell;
    }
    
    return desCell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 2) {
        BidModel *model = _todayRecommend[indexPath.row];
        BidDetailViewController *vc = [[BidDetailViewController alloc] initWithBidModel:model];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - XYHomeFirstCellDelegate

- (void)firstCell:(HomeFirstViewCell *)cell didPressedButtonWithType:(XYHomeButtonType)type {
    if (XYCurrentUser.userState != OLUserStateLogin) {
        LoginViewController *login = [[LoginViewController alloc] init];
        login.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:login animated:YES];
        
        return;
    }
    
    if (type == XYHomeButtonTypeSign) {
        HomeSignView *view = [HomeSignView signView];
        view.delegate = self;
        [view show];
        
        [self sendRequest:^(XMRequest * _Nonnull request) {
            request.api = HomePage_Sign_URL;
            request.parameters = @{@"userId" :  XYCurrentUser.userID};
        } showHUD:YES onSuccess:^(id  _Nullable responseObject) {
            NSMutableArray<NSDate *> *dates = [NSMutableArray array];
            for (NSDictionary *data in responseObject[@"list"]) {
                NSTimeInterval timeInterval = [data floatValueForKey:@"signTime" default:0];
                NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval / 1000.0];
                [dates addObject:date];
            }
            [view setSeletedDates:dates];
        }];
    } else if (type == XYHomeButtonTypeAppointment) {
        LoanViewController *vc = [[LoanViewController alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    } else if (type == XYHomeButtonTypeBid) {
        PlanBidViewController *bid = [[PlanBidViewController alloc] init];
        bid.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:bid animated:YES];
    } else if (type == XYHomeButtonTypeInvite) {
        InviteFrinendController *vc = [[InviteFrinendController alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark -
#pragma mark - XYHomeThirdViewCellDelegate

- (void)thirdCell:(HomeThirdViewCell *)cell didPressedBuyButton:(UIButton *)buyButton {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    [self tableView:self.tableView didSelectRowAtIndexPath:indexPath];
}

#pragma mark -
#pragma mark - HomeSignViewDelegate

- (void)homeSignView:(HomeSignView *)view didPressSignButton:(UIButton *)signButton {
    [self sendSilentRequest:^(XMRequest * _Nonnull request) {
        request.api = HomePage_Sigin_URL;
        request.parameters = @{@"userId" : XYCurrentUser.userID};
    } onSuccess:^(id  _Nullable responseObject) {
        [self showHUDText:@"签到成功"];
    } onFinished:^(id  _Nullable responseObject, NSError * _Nullable error) {
        [view dismiss];
    }];
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
