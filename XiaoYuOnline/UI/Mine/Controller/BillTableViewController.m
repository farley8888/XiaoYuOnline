//
//  XYBillTableViewController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/4.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "BillTableViewController.h"
#import "BillTableViewCell.h"
#import "BillModel.h"

static NSString *billReuseID = @"XYBillReuseIdentifier";

@interface BillTableViewController ()
@property (nonatomic, strong) NSMutableArray<BillModel *> *billList;
@property (nonatomic, strong) NSDateFormatter *dataFormatter;
@end

@implementation BillTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _billList = [NSMutableArray array];
    
    self.title = NSLocalizedString(@"Mine_BillTitle", nil);
    self.tableView.rowHeight = 56.0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UINib *billNib = [UINib nibWithNibName:@"BillTableViewCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:billNib forCellReuseIdentifier:billReuseID];
    
    self.enablePullToRefresh = YES;
    _dataFormatter = [[NSDateFormatter alloc] init];
    _dataFormatter.dateFormat = @"yyyy-MM-dd HH:mm";
}

- (void)loadDataWithPage:(NSInteger)page isRefresh:(BOOL)isRefresh {
    __weak typeof(self) weakSelf = self;
    [self sendSilentRequest:^(XMRequest * _Nonnull request) {
        request.api = Mine_Bill_List_URL;
        request.parameters = @{@"userId" : XYCurrentUser.userID,
                               @"page" : @(weakSelf.page),
                               @"pageSize" : @(weakSelf.pageSize)
                               };
    } onSuccess:^(id  _Nullable responseObject) {
        NSMutableArray *marr = [NSMutableArray array];
        for (NSDictionary *data in responseObject[@"list"]) {
            BillModel *bill = [[BillModel alloc] initWithBillListApiData:data];
            [marr addObject:bill];
        }
        
        if (isRefresh) {
            [weakSelf.billList removeAllObjects];
        }
        [weakSelf.billList addObjectsFromArray:marr];
        [weakSelf.tableView reloadData];
        [weakSelf didLoadDataCount:marr.count];
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _billList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BillTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:billReuseID forIndexPath:indexPath];
    BillModel *model = _billList[indexPath.row];
    cell.valueLabel.text = model.moneyDisp;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:model.addTime];
    cell.leftBottomLabel.text = [_dataFormatter stringFromDate:date];
    if (model.title) {
        cell.titleLabel.text = model.title;
    } else {
        cell.titleLabel.text = model.remark;
    }
    
    if (model.status == XYBillStatusSuccess) {
        cell.rightBottomLabel.text = @"成功";
    } else {
        cell.rightBottomLabel.text = @"失败";
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
