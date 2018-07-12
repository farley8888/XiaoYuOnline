//
//  XYWellBeingViewController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/6.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "WellBeingViewController.h"
#import "CardBagViewController.h"
#import "ScoreShopViewController.h"
#import "WellBeingViewCell.h"
#import "WellBeingModel.h"

static NSString *wellBeingReuseID = @"XYWellBeingReuseIdentifier";

@interface WellBeingViewController ()
@property (nonatomic, strong) NSArray<XYWellBeingModel *> *itemList;
@end

@implementation WellBeingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Mine_Setting_WB_Prefecture", nil);
    _itemList = [XYWellBeingModel placeholderDatasourceList];
    self.tableView.rowHeight = [XYWellBeingViewCell rowHeight];
    [self.tableView registerClass:[XYWellBeingViewCell class] forCellReuseIdentifier:wellBeingReuseID];
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
    XYWellBeingViewCell *cell = [tableView dequeueReusableCellWithIdentifier:wellBeingReuseID forIndexPath:indexPath];
    XYWellBeingModel *model = _itemList[indexPath.row];
    cell.titleLabel.text = model.title;
    cell.contentImageView.image = [UIImage imageNamed:model.imageURL];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *desVC = nil;
    switch (indexPath.row) {
        case 0:
            desVC = [[XYCardBagViewController alloc] init];
            break;
        case 1:
            desVC = [[XYScoreShopViewController alloc] init];
            break;
        default:
            break;
    }
    if (desVC) {
        [self.navigationController pushViewController:desVC animated:YES];
    }
}

@end
