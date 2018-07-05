//
//  XYShippingAddressController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/5.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYShippingAddressController.h"
#import "XYBaseInfoModel.h"
#import "XYRealNameTableViewCell.h"

static NSString *shippingAddressReuseID = @"XYShippingAddressReuseIdentifier";

#pragma mark -
#pragma mark - DatasourceCategory

@interface XYBaseInfoModel (ShippingAddress)
/// 收货地址数据源列表
+ (NSArray <XYBaseInfoModel *> *)shippingAddressDatasourceList;
@end

#pragma mark -
#pragma mark - XYShippingAddressController

@interface XYShippingAddressController ()
@property (nonatomic, strong) NSArray<XYBaseInfoModel *> *itemList;
@end

@implementation XYShippingAddressController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    _itemList = [XYBaseInfoModel shippingAddressDatasourceList];
    
    self.title = NSLocalizedString(@"Mine_Setting_BindCard", nil);
    self.tableView.backgroundColor = XYGlobalUI.backgroundColor;
    self.tableView.rowHeight = 48.0;
    self.tableView.sectionHeaderHeight = 7.0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [self tableFooterView];
    self.tableView.tableHeaderView = [self tableHeaderView];
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [self.tableView registerClass:[XYRealNameTableViewCell class] forCellReuseIdentifier:shippingAddressReuseID];
}

- (UIView *)tableHeaderView {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 32.0)];
    headerView.backgroundColor = XYGlobalUI.backgroundColor;
    UILabel *label = [[UILabel alloc] init];
    label.font = XYGlobalUI.smallFont_12;
    label.textColor = XYGlobalUI.grayColor;
    label.text = NSLocalizedString(@"Mine_Setting_SA_Alert", nil);
    [headerView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headerView).offset(21.0);
        make.centerY.equalTo(headerView).offset(3.0);
        make.right.equalTo(headerView).offset(-21.0);
    }];
    
    return headerView;
}

- (UIView *)tableFooterView {
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 80)];
    footerView.backgroundColor = XYGlobalUI.backgroundColor;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:XYGlobalUI.yellowButtonBackgroundImage forState:UIControlStateNormal];
    [button setTitleColor:XYGlobalUI.whiteColor forState:UIControlStateNormal];
    [button setTitle:NSLocalizedString(@"Public_Save", nil) forState:UIControlStateNormal];
    [footerView addSubview:button];
    
    // Layout
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(footerView);
        make.bottom.equalTo(footerView);
        make.size.mas_equalTo(CGSizeMake(260.0, 65.0));
    }];
    
    return footerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _itemList.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XYRealNameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:shippingAddressReuseID forIndexPath:indexPath];
    XYBaseInfoModel *model = _itemList[indexPath.row];
    cell.titleLabel.text = model.title;
    cell.textField.placeholder = model.scriptDescription;
    
    return cell;
}

@end

@implementation XYBaseInfoModel (ShippingAddress)

+ (NSArray <XYBaseInfoModel *> *)shippingAddressDatasourceList {
    return @[[[XYBaseInfoModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_SA_Receiver", nil) content:nil description:NSLocalizedString(@"Mine_Setting_SA_Receiver_P", nil)],
             [[XYBaseInfoModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_SA_Phone", nil) content:nil description:NSLocalizedString(@"Mine_Setting_SA_Phone_P", nil)],
             [[XYBaseInfoModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_SA_Address", nil) content:nil description:NSLocalizedString(@"Mine_Setting_SA_Address_P", nil)],
             [[XYBaseInfoModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_SA_Comment", nil) content:nil description:NSLocalizedString(@"Mine_Setting_SA_Comment_P", nil)]
             ];
}

@end

