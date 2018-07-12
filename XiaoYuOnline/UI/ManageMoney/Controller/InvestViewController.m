//
//  InvestViewController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/10.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

//#import "InvestViewController.h"
#import "InvestViewController+Custeffet.h"
#import "UIViewController+ShowTextHUD.h"
#import "UIView+Common.h"
#import "PreferentialModel.h"

@interface InvestViewController () {
    UIView *_lineView;
}
/// 投资金额
@property (nonatomic, strong) UILabel *investVolumeLabel;
/// 购买限额
@property(nonatomic, strong) UILabel *buyRestrictLabel;
/// 预期收益
@property (nonatomic, strong) UILabel *expectProfitLabel;
/// 输入
@property (nonatomic, strong) UITextField *inputTextField;
/// 使用红包
@property (nonatomic, strong) UIButton *useBonusButton;
/// 使用现金券
@property (nonatomic, strong) UIButton *useCashVoucherButton;
/// 使用加息券
@property (nonatomic, strong) UIButton *useAddInterestButton;
/// 底部券
@property (nonatomic, strong) UIScrollView *vouchersView;
/// 前一个
@property (nonatomic, strong) UIButton *previousButton;
/// 下一个
@property (nonatomic, strong) UIButton *nextButton;
/// 立即投资
@property (nonatomic, strong) UIButton *investButton;
@property (nonatomic, strong) UIView *investBackView;
@property (nonatomic, strong) NSMutableArray<UIButton *> *voucherImageList;
@property (nonatomic, strong) NSMutableArray<PreferentialModel *> *preferentialList;
@property (nonatomic, strong) NSMutableArray<PreferentialModel *> *cashTicketList;
@property (nonatomic, strong) NSMutableArray<PreferentialModel *> *profitTicketList;

@property (nonatomic, strong) UIButton *lastSelectedButton;
@property (nonatomic, strong) UIButton *selectedTicketButton;
@property (nonatomic, copy) NSString *bidId;
@end

@implementation InvestViewController

- (instancetype)initWithBidId:(NSString *)bidId {
    self = [super init];
    if (self) {
        _bidId = bidId;
        _preferentialList = [NSMutableArray array];
        _cashTicketList = [NSMutableArray array];
        _profitTicketList = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"ManageMoney_Invest", nil);
    _voucherImageList = [NSMutableArray array];
    
    UIScrollView *scrollContent = [[UIScrollView alloc] init];
    scrollContent.backgroundColor = XYGlobalUI.backgroundColor;
    scrollContent.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    scrollContent.bounces = YES;
    scrollContent.alwaysBounceVertical = YES;
    [self.view addSubview:scrollContent];
    UIView *contentView = [[UIView alloc] init];
    contentView.backgroundColor = [UIColor whiteColor];
    [scrollContent addSubview:contentView];
    
    // Layout
    [scrollContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(scrollContent).offset(8.0);
        make.left.right.equalTo(scrollContent);
        make.bottom.equalTo(scrollContent).offset(8.0);
        make.width.equalTo(scrollContent);
    }];
    
    [self loadSubviewsWithContentView:contentView];
    
    _investVolumeLabel.text = @"投资金额";
    _buyRestrictLabel.text = @"购买限额";
    _inputTextField.placeholder = @"100 元起投";
    _expectProfitLabel.text = @"预期收益：100 元";
    
    [self layoutSubviewsInContentView:contentView];
}

- (void)loadSubviewsWithContentView:(UIView *)contentView {
    _investVolumeLabel = [[UILabel alloc] init];
    _investVolumeLabel.font = XYGlobalUI.smallFont_14;
    
    _buyRestrictLabel = [[UILabel alloc] init];
    _buyRestrictLabel.font = XYGlobalUI.smallFont_14;
    
    _inputTextField = [[UITextField alloc] init];
    _inputTextField.font = [UIFont systemFontOfSize:20.0];
    _inputTextField.keyboardType = UIKeyboardTypePhonePad;
    UIImageView *left = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"manage_invest_left"]];
    [_inputTextField addTarget:self action:@selector(inputValueChanged) forControlEvents:UIControlEventEditingChanged];
    left.contentMode = UIViewContentModeLeft;
    left.bounds = CGRectMake(0, 0, 17, 14);
    _inputTextField.leftView = left;
    _inputTextField.leftViewMode = UITextFieldViewModeAlways;
    
    _expectProfitLabel = [[UILabel alloc] init];
    _expectProfitLabel.font = XYGlobalUI.smallFont_9;
    _expectProfitLabel.textColor = XYGlobalUI.grayColor;
    
    UIEdgeInsets edge = UIEdgeInsetsMake(0, 6, 0, -6);
    _useBonusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _useBonusButton.backgroundColor = XYGlobalUI.backgroundColor;
    _useBonusButton.titleLabel.font = XYGlobalUI.smallFont_14;
    _useBonusButton.titleEdgeInsets = edge;
    _useBonusButton.selected = YES;
    _lastSelectedButton = _useBonusButton;
    [_useBonusButton setTitleColor:XYGlobalUI.blackColor forState:UIControlStateNormal];
    [_useBonusButton setTitle:@"使用红包" forState:UIControlStateNormal];
    [_useBonusButton setImage:[UIImage imageNamed:@"manage_invest_unuse"] forState:UIControlStateNormal];
    [_useBonusButton setImage:[UIImage imageNamed:@"manage_invest_use"] forState:UIControlStateSelected];
    [_useBonusButton addTarget:self action:@selector(useButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _useCashVoucherButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _useCashVoucherButton.backgroundColor = XYGlobalUI.backgroundColor;
    _useCashVoucherButton.titleLabel.font = XYGlobalUI.smallFont_14;
    _useCashVoucherButton.titleEdgeInsets = edge;
    [_useCashVoucherButton setTitleColor:XYGlobalUI.blackColor forState:UIControlStateNormal];
    [_useCashVoucherButton setTitle:@"使用现金券" forState:UIControlStateNormal];
    [_useCashVoucherButton setImage:[UIImage imageNamed:@"manage_invest_unuse"] forState:UIControlStateNormal];
    [_useCashVoucherButton setImage:[UIImage imageNamed:@"manage_invest_use"] forState:UIControlStateSelected];
    [_useCashVoucherButton addTarget:self action:@selector(useButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _useAddInterestButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _useAddInterestButton.backgroundColor = XYGlobalUI.backgroundColor;
    _useAddInterestButton.titleLabel.font = XYGlobalUI.smallFont_14;
    _useAddInterestButton.titleEdgeInsets = edge;
    [_useAddInterestButton setTitleColor:XYGlobalUI.blackColor forState:UIControlStateNormal];
    [_useAddInterestButton setTitle:@"使用加息券" forState:UIControlStateNormal];
    [_useAddInterestButton setImage:[UIImage imageNamed:@"manage_invest_unuse"] forState:UIControlStateNormal];
    [_useAddInterestButton setImage:[UIImage imageNamed:@"manage_invest_use"] forState:UIControlStateSelected];
    [_useAddInterestButton addTarget:self action:@selector(useButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _vouchersView = [[UIScrollView alloc] init];
    _vouchersView.backgroundColor = XYGlobalUI.whiteColor;
    _vouchersView.showsHorizontalScrollIndicator = NO;
    
    _previousButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _previousButton.backgroundColor = XYGlobalUI.whiteColor;
    [_previousButton setTitleColor:XYGlobalUI.blackColor forState:UIControlStateNormal];
    [_previousButton setImage:[UIImage imageNamed:@"manage_invest_previous"] forState:UIControlStateNormal];
    [_previousButton addTarget:self action:@selector(previousButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    _nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _nextButton.backgroundColor = XYGlobalUI.whiteColor;
    [_nextButton setTitleColor:XYGlobalUI.blackColor forState:UIControlStateNormal];
    [_nextButton setImage:[UIImage imageNamed:@"manage_invest_next"] forState:UIControlStateNormal];
    [_nextButton addTarget:self action:@selector(nextButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    _lineView = [[UIView alloc] init];
    _lineView.backgroundColor = XYGlobalUI.lightGrayColor;
    
    _investButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_investButton setTitleColor:XYGlobalUI.whiteColor forState:UIControlStateNormal];
    [_investButton setTitle:NSLocalizedString(@"ManageMoney_InvestNow", nil) forState:UIControlStateNormal];
    UIImage *img = [[UIImage imageNamed:@"main_btn_50diameter_bg"] stretchableImageWithLeftCapWidth:25 topCapHeight:25];
    [_investButton addTarget:self action:@selector(investButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_investButton setBackgroundImage:img forState:UIControlStateNormal];
    _investBackView = [[UIView alloc] init];
    _investBackView.backgroundColor = XYGlobalUI.backgroundColor;
    
    UIView *superView = contentView;
    [superView addSubview:_investVolumeLabel];
    [superView addSubview:_buyRestrictLabel];
    [superView addSubview:_inputTextField];
    [superView addSubview:_expectProfitLabel];
    [superView addSubview:_useBonusButton];
    [superView addSubview:_useCashVoucherButton];
    [superView addSubview:_useAddInterestButton];
    [superView addSubview:_vouchersView];
    [superView addSubview:_previousButton];
    [superView addSubview:_nextButton];
    [superView addSubview:_lineView];
    [superView addSubview:_investBackView];
    [_investBackView addSubview:_investButton];
}

- (void)loadPreferentialViews {
    [_vouchersView removeAllSubviews];
    [_voucherImageList removeAllObjects];
    
    NSArray *list;
    NSString *infoText;
    if (_useBonusButton.selected) {
        list = _preferentialList;
        infoText = @"红包";
    } else if (_useCashVoucherButton.selected) {
        list = _cashTicketList;
        infoText = @"现金券";
    } else {
        list = _profitTicketList;
        infoText = @"加息券";
    }
    
    if (list && list.count > 0) {
        CGFloat x = 0, w = 66.0;
        CGFloat y = (_vouchersView.height - w) / 2.0;
        
        for (NSUInteger i = 0, count = list.count; i < count; i ++) {
            PreferentialModel *model = list[i];
            UIButton *ticketBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [ticketBtn setBackgroundImage:[UIImage imageNamed:@"manage_invest_voucher_gray"] forState:UIControlStateDisabled];
            [ticketBtn addTarget:self action:@selector(selectTicketButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            ticketBtn.enabled = NO;
            [ticketBtn setTitleColor:XYGlobalUI.blackColor forState:UIControlStateNormal];
            x = 3 + (w + 12) * i;
            ticketBtn.frame = CGRectMake(x, y, w, w);
            if (model.type == XYPreferentialTypeBonus) {
                [ticketBtn setBackgroundImage:[UIImage imageNamed:@"manage_invest_voucher_red"] forState:UIControlStateNormal];
            } else if (model.type == XYPreferentialTypeCashTicket) {
                [ticketBtn setBackgroundImage:[UIImage imageNamed:@"manage_invest_voucher_yellow"] forState:UIControlStateNormal];
            } else {
                [ticketBtn setBackgroundImage:[UIImage imageNamed:@"manage_invest_voucher_blue"] forState:UIControlStateNormal];
            }
            
            [_vouchersView addSubview:ticketBtn];
            [_voucherImageList addObject:ticketBtn];
            
            UILabel *vL = [[UILabel alloc] init];
            vL.font = XYGlobalUI.smallFont_14;
            vL.textColor = XYGlobalUI.whiteColor;
            vL.textAlignment = NSTextAlignmentCenter;
            vL.frame = CGRectMake(0, 12.0, w, 16.0);
            
            UILabel *dL = [[UILabel alloc] init];
            dL.font = XYGlobalUI.smallFont_9;
            dL.textColor = XYGlobalUI.whiteColor;
            dL.textAlignment = NSTextAlignmentCenter;
            dL.numberOfLines = 2;
            dL.frame = CGRectMake(0, 36.0, w, 24.0);
            [ticketBtn addSubview:vL];
            [ticketBtn addSubview:dL];
            
            vL.text = [NSString stringWithFormat:@"¥%@", model.value];
            dL.text = [NSString stringWithFormat:@"满%@使用\n%@", model.usableMoney, @"2018/06/22"];
        }
        _vouchersView.contentSize = CGSizeMake(x + w + 3 * 2, _vouchersView.height);
    } else {
        UILabel *label = [[UILabel alloc] initWithFrame:_vouchersView.bounds];
        label.font = XYGlobalUI.smallFont_14;
        label.text = [NSString stringWithFormat:@"暂无%@", infoText];
        label.textAlignment = NSTextAlignmentCenter;
        [_vouchersView addSubview:label];
        _vouchersView.contentSize = _vouchersView.frame.size;
    }
}

- (void)layoutSubviewsInContentView:(UIView *)contentView {
    UIView *superView = contentView;
    
    [_investVolumeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superView).offset(35.0);
        make.top.equalTo(superView).offset(6.0);
    }];
    [_buyRestrictLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(superView).offset(-35.0);
        make.top.equalTo(superView).offset(6.0);
    }];
    [_inputTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_investVolumeLabel.mas_bottom).offset(26.0);
        make.left.equalTo(superView).offset(35.0);
        make.right.equalTo(superView).offset(-35.0);
    }];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(superView);
        make.top.equalTo(self->_inputTextField.mas_bottom).offset(8.0);
        make.height.equalTo(@0.5);
    }];
    [_expectProfitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superView).offset(35.0);
        make.right.equalTo(superView).offset(-35.0);
        make.top.equalTo(self->_lineView.mas_bottom).offset(8.0);
    }];
    [@[_useBonusButton, _useCashVoucherButton, _useAddInterestButton] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_expectProfitLabel.mas_bottom).offset(8.0);
        make.height.equalTo(@48.0);
    }];
    [_useBonusButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superView);
    }];
    [_useCashVoucherButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_useBonusButton.mas_right);
        make.width.equalTo(self->_useBonusButton);
    }];
    [_useAddInterestButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_useCashVoucherButton.mas_right);
        make.width.equalTo(self->_useCashVoucherButton);
        make.right.equalTo(superView);
    }];
    [_previousButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superView);
        make.size.mas_equalTo(CGSizeMake(27, 97));
        make.top.equalTo(self->_useBonusButton.mas_bottom);
    }];
    [_nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(superView);
        make.size.mas_equalTo(CGSizeMake(27, 97));
        make.top.equalTo(self->_useAddInterestButton.mas_bottom);
    }];
    [_investBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(superView);
        make.top.equalTo(self->_nextButton.mas_bottom);
    }];
    [_investButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self->_investBackView);
        make.size.mas_equalTo(CGSizeMake(260, 50));
        make.top.equalTo(self->_investBackView).offset(8.0);
        make.centerX.equalTo(self->_investBackView);
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (CGRectEqualToRect(_vouchersView.frame, CGRectZero)) {
        _vouchersView.frame = CGRectMake(_previousButton.right, _previousButton.y, self.view.width - 27 * 2, 97);
        // 加载数据
        if (_bidId) {
            __weak typeof(self) weakSelf = self;
            [self sendRequest:^(XMRequest * _Nonnull request) {
                request.api = HomePage_Invest_URL;
                request.parameters = @{@"userId" : XYCurrentUser.userID, @"id" : weakSelf.bidId};
            } showHUD:YES onSuccess:^(id  _Nullable responseObject) {
                for (NSDictionary *data in responseObject[@"welfares"]) {
                    PreferentialModel *model = [[PreferentialModel alloc] initWithApiData:data];
                    if (model.type == XYPreferentialTypeBonus) {
                        [weakSelf.preferentialList addObject:model];
                    } else if (model.type == XYPreferentialTypeCashTicket) {
                        [weakSelf.cashTicketList addObject:model];
                    } else {
                        [weakSelf.profitTicketList addObject:model];
                    }
                }
                [weakSelf loadPreferentialViews];
            }];
        }
    }
}

- (void)useButtonAction:(UIButton *)button {
    NSInteger value = _inputTextField.text.integerValue;
    if (value < 100 || (value % 100 != 0)) {
        [self showHUDText:@"投资金额有误" description:@"投资金额必须多于 100 元，且投资金额为 100 的整数倍"];
        return;
    }
    [_inputTextField resignFirstResponder];
    
    _lastSelectedButton.selected = NO;
    button.selected = !button.selected;
    
    [self loadPreferentialViews];
    [self inputValueChanged];
    
    _lastSelectedButton = button;
}
/// 上一页
- (void)previousButtonAction {
    CGPoint contentOffset = _vouchersView.contentOffset;
    CGFloat viewW = 66, space = 12, leftEdge = 3;
    CGFloat itemW = viewW + space;
    
    NSInteger maxCount = (int)((_vouchersView.width - leftEdge * 2) / itemW);
    CGFloat maxWidth = contentOffset.x + _vouchersView.width - leftEdge;
    NSInteger maxIndex = (int) (maxWidth / (itemW));
    CGFloat leftToScroll = (leftEdge + itemW *maxIndex) - contentOffset.x;
    NSInteger minCount = (int)(leftToScroll / itemW);
    NSInteger desIndex = maxIndex - minCount;
    
    if (desIndex <= maxCount) {
        contentOffset.x = 0;
    } else {
        contentOffset.x = 3 + desIndex * itemW - _vouchersView.width;
    }
    [_vouchersView setContentOffset:contentOffset animated:YES];
}
/// 下一页
- (void)nextButtonAction {
    CGPoint contentOffset = _vouchersView.contentOffset;
    CGFloat viewW = 66, space = 12, leftEdge = 3;
    CGFloat itemW = viewW + space;
    CGFloat maxWidth = contentOffset.x + _vouchersView.width - leftEdge;
    NSInteger maxCount = (int)((_vouchersView.width - leftEdge * 2) / itemW);
    NSInteger index = (int) (maxWidth / (itemW));

    if (_voucherImageList.count - index <= maxCount) {
        contentOffset.x = _vouchersView.contentSize.width - _vouchersView.width;
    } else {
        contentOffset.x = leftEdge + (index - 1) * itemW + viewW;
    }
    
    [_vouchersView setContentOffset:contentOffset animated:YES];
}

- (void)inputValueChanged {
    NSInteger value = _inputTextField.text.integerValue;
    if (value >= 100 && (value % 100 == 0)) {
        NSArray *list;
        if (_useBonusButton.selected) {
            list = _preferentialList;
        } else if (_useCashVoucherButton.selected) {
            list = _cashTicketList;
        } else {
            list = _profitTicketList;
        }
        
        for (NSUInteger i = 0, count = list.count; i < count; i ++) {
            PreferentialModel *model = list[i];
            UIButton *btn = _voucherImageList[i];
            btn.enabled = model.usableMoney.floatValue <= value;
            if (model.usableMoney.floatValue > value && [btn titleForState:UIControlStateNormal]) {
                [btn setTitle:nil forState:UIControlStateNormal];
                btn.selected = NO;
            }
        }
    }
}

- (void)selectTicketButtonAction:(UIButton *)button {
    button.selected = !button.selected;
    
    if (button.selected) {
        for (UIButton *btn in _voucherImageList) {
            btn.enabled = NO;
            [button setTitle:nil forState:UIControlStateNormal];
            
            if (btn == button) {
                btn.enabled = YES;
            }
        }
        [button setTitle:@"已选择" forState:UIControlStateNormal];
        _selectedTicketButton = button;
    } else {
        [button setTitle:nil forState:UIControlStateNormal];
        [self inputValueChanged];
        _selectedTicketButton = nil;
    }
}

- (void)investButtonAction:(UIButton *)button {
    NSInteger value = _inputTextField.text.integerValue;
    if (value < 100 || (value % 100 != 0)) {
        [self showHUDText:@"投资金额有误" description:@"投资金额必须多于 100 元，且投资金额为 100 的整数倍"];
        return;
    }
    
    __weak typeof(self) weakSelf = self;
    NSString *welfareId = @"";
    NSArray *list;
    if (_useBonusButton.selected) {
        list = _preferentialList;
    } else if (_useCashVoucherButton.selected) {
        list = _cashTicketList;
    } else {
        list = _profitTicketList;
    }
    for (UIButton *btn in _voucherImageList) {
        if (btn.selected) {
            NSInteger index = [_voucherImageList indexOfObject:btn];
            PreferentialModel *model = list[index];
            welfareId = model.preferentialID;
            
            break;
        }
    }
    [self sendRequest:^(XMRequest * _Nonnull request) {
        request.api = HomePage_InvestNow_URL;
        request.parameters = @{@"userId" : XYCurrentUser.userID,
                               @"borrowId" : weakSelf.bidId,
                               @"welfareId" : welfareId,
                               @"transAmt" : weakSelf.inputTextField.text
                               };
    } onSuccess:^(id  _Nullable responseObject) {
        [[NSNotificationCenter defaultCenter] postNotificationName:OLUserAssetDidChangedNotification object:responseObject];
    } successHint:@"投资成功" onFailure:NULL];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
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
