//
//  XYQAViewController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/4.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "QAViewController.h"
#import "XYQATableViewCell.h"
#import "XYQAModel.h"
#import "UIImage+Common.h"
#import "QADetailViewController.h"
#import "UIView+Common.h"

static NSString *QACellReuseID = @"XYQACellReuseIdentifier";

@interface QAViewController ()
@property (nonatomic, strong) NSArray<XYQAModel *> *itemList;
@property (nonatomic, strong) UIImage *originImage;
@property (nonatomic, strong) UIImage *navigationBarImage;
@end

@implementation QAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _itemList = [XYQAModel QADatasourceList];
    
    self.tableView.rowHeight = 49.0;
    self.tableView.backgroundColor = XYGlobalUI.backgroundColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableHeaderView = [self tableHeaderView];
    [self.tableView registerClass:[XYQATableViewCell class] forCellReuseIdentifier:QACellReuseID];
    
    _originImage = [self.navigationController.navigationBar backgroundImageForBarMetrics:UIBarMetricsDefault];
    _navigationBarImage = [UIImage imageWithColor:RGB_COLOR(231, 198, 85) size:CGSizeMake(2.0, 2.0)];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:_navigationBarImage forBarMetrics:UIBarMetricsDefault];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:_originImage forBarMetrics:UIBarMetricsDefault];
}

- (UIView *)tableHeaderView {
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 90.0)];
    header.backgroundColor = RGB_COLOR(231, 198, 85);
    CALayer *backLayer = [CALayer layer];
    backLayer.frame = CGRectMake(0, -300.0, SCREEN_WIDTH, 390.0);
    backLayer.backgroundColor = header.backgroundColor.CGColor;
    [header.layer addSublayer:backLayer];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(75.0, 22.0, 120.0, 30.0)];
    label.font = [UIFont systemFontOfSize:25.0];
    label.textColor = [UIColor whiteColor];
    label.text = NSLocalizedString(@"Mine_QA", nil);
    [header addSubview:label];
    
    UIImageView *qImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mine_QA_question"]];
    qImageView.bounds = CGRectMake(0, 0, 70, 70);
    qImageView.center = CGPointMake(label.right + qImageView.width / 2.0 + 10, label.center.y);
    [header addSubview:qImageView];
    
    return header;
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
    XYQATableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:QACellReuseID forIndexPath:indexPath];
    XYQAModel *model = _itemList[indexPath.row];
    cell.titleLabel.text = model.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    XYQAModel *model = _itemList[indexPath.row];
    QADetailViewController *vc = [[QADetailViewController alloc] initWithQAModel:model];
    [self.navigationController pushViewController:vc animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
