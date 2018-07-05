//
//  XYDiscoveryViewController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/3.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYDiscoveryViewController.h"
#import "XYDiscoveryDetailController.h"
#import "XYDiscoveryViewCell.h"
#import "SVPullToRefresh.h"
#import "XYDiscoveryModel.h"

static NSString *discoveryReuseID = @"XYDiscoveryCellReuseIdentifier";

@interface XYDiscoveryViewController ()
@property (nonatomic, strong) NSMutableArray<XYDiscoveryModel *> *itemList;
@end

@implementation XYDiscoveryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Discovery_Title", nil);
    _itemList = [NSMutableArray array];

    self.tableView.rowHeight = 100.0;
    self.tableAdjustContentInsets = UIEdgeInsetsMake(5, 0, 5, 0);
    [self.tableView registerClass:[XYDiscoveryViewCell class] forCellReuseIdentifier:discoveryReuseID];
}

- (void)loadDataWithPage:(NSInteger)page isRefresh:(BOOL)isRefresh {
    __weak typeof(self) weakSelf = self;
    [self sendSilentRequest:^(XMRequest * _Nonnull request) {
        request.api = Discovery_List_URL;
        request.httpMethod = kXMHTTPMethodGET;
        request.parameters = @{@"page" : @(weakSelf.page)};
    } onSuccess:^(id  _Nullable responseObject) {
        NSMutableArray *marr = [NSMutableArray array];
        for (NSDictionary *data in responseObject[@"data"]) {
            XYDiscoveryModel *m = [[XYDiscoveryModel alloc] initWithDiscoveryApiData:data];
            [marr addObject:m];
        }
        
        if (isRefresh) {
            [weakSelf.itemList removeAllObjects];
        }
        
        [weakSelf.itemList addObjectsFromArray:marr];
        [weakSelf.tableView reloadData];
        [weakSelf didLoadDataCount:marr.count];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _itemList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XYDiscoveryViewCell *cell = [tableView dequeueReusableCellWithIdentifier:discoveryReuseID forIndexPath:indexPath];
    XYDiscoveryModel *model = _itemList[indexPath.row];
    cell.titleLabel.text = model.title;
    cell.contentLabel.text = model.scriptDescription;
    cell.timeLabel.text = model.dateString;
    // Configure the cell...
    cell.indicatorImageView.image = model.indicatorImage;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    XYDiscoveryModel *model = _itemList[indexPath.row];
    XYDiscoveryDetailController *detailVC = [[XYDiscoveryDetailController alloc] initWithDiscoveryModel:model];
    detailVC.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:detailVC animated:YES];
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
