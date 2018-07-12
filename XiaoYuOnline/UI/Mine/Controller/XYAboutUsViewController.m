//
//  XYAboutUsViewController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/5.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "AboutUsViewController.h"
#import "AboutUsTableViewCell.h"
#import "AboutUsModel.h"

static NSString *aboutUsReuseID = @"XYAboutUsCellReuseIdentifier";

@interface AboutUsViewController ()
@property (nonatomic, strong) NSArray <XYAboutUsModel *>* itemList;
@end

@implementation AboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    _itemList = [XYAboutUsModel aboutUsDatasourceList];
    
    self.title = NSLocalizedString(@"Mine_AboutUs", nil);
    [self.tableView registerClass:[XYAboutUsTableViewCell class] forCellReuseIdentifier:aboutUsReuseID];
    self.tableView.backgroundColor = XYGlobalUI.backgroundColor;
    self.tableView.tableHeaderView = [self tableHeaderView];
    self.tableView.rowHeight = 54.0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (UIView *)tableHeaderView {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 144)];
    headerView.backgroundColor = XYGlobalUI.backgroundColor;
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mine_aboutUs_logo"]];
    UILabel *label = [[UILabel alloc] init];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = XYGlobalUI.smallFont_14;
    label.text = NSLocalizedString(@"Mine_AboutUs_Xiaoyu", nil);
    [headerView addSubview:imageView];
    [headerView addSubview:label];
    // Layout
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(headerView);
        make.centerY.equalTo(headerView).offset(-15.0);
        make.size.mas_equalTo(CGSizeMake(56, 56));
    }];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(headerView);
        make.left.equalTo(headerView).offset(20.0);
        make.right.equalTo(headerView).offset(-20.0);
        make.top.equalTo(imageView.mas_bottom).offset(10.0);
    }];
    
    return headerView;
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
    XYAboutUsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:aboutUsReuseID forIndexPath:indexPath];
    XYAboutUsModel *model = _itemList[indexPath.row];
    cell.titleLabel.text = model.title;
    cell.descriptionLabel.text = model.content;
    
    return cell;
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
