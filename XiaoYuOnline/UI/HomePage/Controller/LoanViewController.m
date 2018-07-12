//
//  XYLoanViewController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/12.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "LoanViewController.h"
#import "LoanDescriptionCell.h"
#import "UITextView+Placeholder.h"
#import "UIViewController+ShowTextHUD.h"
#import "LoanHeaderView.h"
#import "OLPickerView.h"
#import "LoanViewCell.h"
#import "LoanModel.h"

static NSString *loanReuseID = @"XYLoanCellReuseIdentifier";
static NSString *loanDesReuseID = @"XYLoanDesCellReuseIdentifier";

@interface LoanViewController ()<LoanViewCellDelegate>
@property (nonatomic, strong) NSArray<NSArray<LoanModel *> *> *itemList;
@property (nonatomic, strong) XYLoanFooterView *footerView;
@end

@implementation LoanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"HomePage_Borrow", nil);
    _itemList = [LoanModel loanDatasourceList];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 48.0;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    self.tableView.tableHeaderView = [[LoanHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 70.0)];
    _footerView = [[XYLoanFooterView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 108)];
    [_footerView.checkboxButton addTarget:self action:@selector(checboxButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_footerView.confirmButton addTarget:self action:@selector(comfirmButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.tableView.tableFooterView = _footerView;
    [self.tableView registerClass:[LoanViewCell class] forCellReuseIdentifier:loanReuseID];
    [self.tableView registerClass:[LoanDescriptionCell class] forCellReuseIdentifier:loanDesReuseID];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    if (indexPath.section == 0) {
        LoanViewCell *cell0 = [tableView dequeueReusableCellWithIdentifier:loanReuseID forIndexPath:indexPath];
        LoanModel *model = _itemList[indexPath.section][indexPath.row];
        cell0.titleLabel.text = model.title;
        cell0.textField.placeholder = model.placeHolder;
        cell0.textField.text = model.content;
        cell0.delegate = self;
        
        cell = cell0;
    } else {
        LoanDescriptionCell *cell1 = [tableView dequeueReusableCellWithIdentifier:loanDesReuseID forIndexPath:indexPath];
        LoanModel *model = _itemList[indexPath.section][indexPath.row];
        cell1.titleLabel.text = model.title;
        cell1.textView.placeholder = model.placeHolder;
        cell1.descriptLabel.text = model.scriptDescription;
        cell1.textView.text = model.content;
        cell1.delegate = self;
        
        cell = cell1;
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _itemList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 48.0;
    } else {
        return 180.0;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _itemList[section].count;
}

#pragma mark -
#pragma mark - LoanViewCellDelegate

- (BOOL)loanViewCell:(LoanViewCell *)cell textFieldShouldBeginEditing:(UITextField *)textField {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    LoanModel *model = _itemList[indexPath.section][indexPath.row];
    if (model.editable == NO) {
        [self.view endEditing:YES];
        
        OLPickerView *view = [[OLPickerView alloc] initWithPickerDataSource:model.sheetTitles completionBlock:^(NSString * _Nonnull selectedValue) {
            model.content = selectedValue;
            model.selectedIndex = @([model.sheetTitles indexOfObject:selectedValue] + 1);
            cell.textField.text = selectedValue;
        }];
        [view show];
    }
    
    return model.editable;
}

- (void)loanViewCell:(LoanViewCell *)cell textFieldEditingChanged:(UITextField *)textField {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    if ([textField.text stringByTrimmingCharactersInSet:set].length > 0) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        LoanModel *model = _itemList[indexPath.section][indexPath.row];
        model.content = textField.text;
    }
}

- (void)loanViewCell:(LoanViewCell *)cell textViewDidEndEditing:(UITextView *)textView {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    if ([textView.text stringByTrimmingCharactersInSet:set].length > 0) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        LoanModel *model = _itemList[indexPath.section][indexPath.row];
        model.content = textView.text;
    }
}

#pragma mark -
#pragma mark - Event Response

- (void)checboxButtonAction:(UIButton *)button {
    button.selected = !button.selected;
    
    _footerView.confirmButton.enabled = button.selected;
}

- (void)comfirmButtonAction:(UIButton *)button {
    if (_itemList.count < 2) {
        return;
    }
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    NSArray *keys = @[@"money", @"apr", @"limitTime", @"productType", @"validTime", @"name", @"telephone", @"description", @"collateralDescription"];
    NSMutableArray<LoanModel *> *arr = [NSMutableArray arrayWithArray:_itemList[0]];
    [arr addObjectsFromArray:_itemList[1]];
    for (NSUInteger i = 0, count = keys.count; i < count; i ++) {
        LoanModel *model = arr[i];
        if (!model.content || model.content.length == 0) {
            [self showHUDText:[NSString stringWithFormat:@"%@不能为空", model.title]];
            return;
        } else {
            if (model.sheetTitles) {
                if (i == 3) { // 针对业务类型的特殊处理，需要传数字类型，且从 0 开始
                    [params setObject:@(model.selectedIndex.integerValue - 1) forKey:keys[i]];
                } else {
                    [params setObject:model.selectedIndex forKey:keys[i]];
                }
            } else {
                [params setObject:model.content forKey:keys[i]];
            }
            
        }
    }
    
    NSLog(@"BorrowParams:%@", params);
    [self sendRequest:^(XMRequest * _Nonnull request) {
        request.api = HomePage_Borrow_URL;
        request.parameters = params;
    } showHUD:YES onSuccess:^(id  _Nullable responseObject) {
        [self showHUDText:@"借款申请已提交！"];
    }];
    
}

@end
