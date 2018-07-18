//
//  FCounterViewController.m
//  ftool
//
//  Created by apple on 2018/6/20.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "FCounterViewController.h"
#import "FHomeCell.h"
#import "FHouseCounterViewController.h"
#import "YGCTradeWindow.h"
#import "ZTAppCalculatorViewController.h"

@interface FCounterViewController (){
    NSArray *groupTitls;
    NSInteger rowCount; //行计算
}

@end

static NSString * const reuseIdentifier = @"FHomeCell";


@implementation FCounterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NavBar *bar = [[NavBar alloc] initWithTitle:@"计算器集" leftName:@"🔙" rightName:nil delegate:self];
//    bar.leftBtn.hidden = YES;  //隐藏返回按钮
    
//    [_tableView registerClass:[BaseContentCell class] forCellReuseIdentifier:@"RateViewCell"];
 [self.tableView registerNib:[UINib nibWithNibName:reuseIdentifier bundle:nil] forCellReuseIdentifier:reuseIdentifier];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
//    groupTitls = @[@"存款", @"贷款", @"理财", @"简计"];
    groupTitls = @[@"存款", @"贷款", @"简计"];
//    self.dataArray = @[@"存款计算器", @"房贷计算器", @"普通贷款计算器", @"理财计算器", @"小计算器"].mutableCopy;
        self.dataArray = @[@"存款计算器", @"房贷计算器", @"普通贷款计算器", @"小计器"].mutableCopy;
    rowCount = 0;
}


//显示多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return groupTitls.count;
}


//每一组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) { //section组
        return 1;
    } else if (section == 1) {
        return 2;
    } else if (section == 2) {
        return 1;
    } else {
        return 1;
    }
}

//每组标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section < groupTitls.count)  return groupTitls[section];
    else             return @"counter";
}

//每一组的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    //    NSInteger section = indexPath.section;
    //    NSInteger row = indexPath.row;
    //    if (section == 0) {
    //        if (row == 0) {
    if (rowCount >= self.dataArray.count) rowCount = 0;
    
    cell.textLabel.text = self.dataArray[rowCount];
    rowCount++;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld", indexPath.row);
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    UIStoryboard *homeStoryboard = [UIStoryboard storyboardWithName:@"Counters" bundle:nil];
    UIViewController *controller = nil;
    if (section == 0) { //存款计算
        controller = [homeStoryboard instantiateViewControllerWithIdentifier:@"SaveCounter"];
    }
    else if (section == 1) { //第二组，只有这组有两条
        if(row == 0){   //房贷计算
            controller = [[FHouseCounterViewController alloc] init];
        }else{          //其它贷款计算
            controller = [homeStoryboard instantiateViewControllerWithIdentifier:@"CommonCounter"];
        }
    }else if (section == 2){ //第三组
//        controller = [homeStoryboard instantiateViewControllerWithIdentifier:@"FinanceCounter"];
        [self showFloatWindow];
    }else { //第四组 /生活小计
        [self showFloatWindow];
//                controller =  [[ZTAppCalculatorViewController alloc] init];
//                ((ZTAppCalculatorViewController *)controller).isNew = YES;
    }
    if (controller != nil) {
        controller.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:controller animated:YES];
    }
}

// 添加悬浮计算器
- (void)showFloatWindow{
    
    if ([YGCTradeWindow isShow]) {
        [YGCTradeWindow hide];
    } else {
        // 弹出浮层界面
        ZTAppCalculatorViewController *vc = [[ZTAppCalculatorViewController alloc] init];
        //    vc.view.backgroundColor = [UIColor blueColor];
        [YGCTradeWindow showWithVc:vc];
        [YGCTradeWindow shareWindow].frame =  CGRectMake(([UIScreen mainScreen].bounds.size.width - 220)*0.5, ([UIScreen mainScreen].bounds.size.height - 383)*0.5, 220, 383);
        [YGCTradeWindow shareWindow].windowLevel = MAXFLOAT;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
