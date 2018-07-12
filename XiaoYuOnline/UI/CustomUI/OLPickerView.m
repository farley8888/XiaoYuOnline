//
//  XYPickerView.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/16.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "OLPickerView.h"
#import "UIView+Common.h"

@interface OLPickerView ()<UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIButton *commitButton;
@property (nonatomic, assign) CGFloat pickHeight;
@property (nonatomic, assign) CGFloat barHeight;

@property (nonatomic, strong) NSArray *datasource;
@property (nonatomic, copy) void(^completeBlock)(NSString *selectedValue);
@end

@implementation OLPickerView

- (instancetype)initWithPickerDataSource:(NSArray<NSString *> *)datasource completionBlock:(void (^)(NSString * _Nonnull))completionBlock
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _pickHeight = 216.0;
        _barHeight = 44.0;
        
        _datasource = datasource;
        self.completeBlock = completionBlock;
        
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelButton.backgroundColor = XYGlobalUI.whiteColor;
        _cancelButton.titleLabel.font = XYGlobalUI.mainFont;
        [_cancelButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [_cancelButton addTarget:self action:@selector(cancelButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [_cancelButton setTitleColor:XYGlobalUI.blackColor forState:UIControlStateNormal];
        [_cancelButton setTitle:NSLocalizedString(@"Public_Cancel", nil) forState:UIControlStateNormal];
        [self.contentView addSubview:_cancelButton];
        
        _commitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _commitButton.backgroundColor = XYGlobalUI.whiteColor;
        _commitButton.titleLabel.font = XYGlobalUI.mainFont;
        [_commitButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        [_commitButton setTitleColor:XYGlobalUI.blackColor forState:UIControlStateNormal];
        [_commitButton addTarget:self action:@selector(commitButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [_commitButton setTitle:NSLocalizedString(@"Public_Confirm", nil) forState:UIControlStateNormal];
        [self.contentView addSubview:_commitButton];
        
        _pickerView = [[UIPickerView alloc] init];
        _pickerView.dataSource = self;
        _pickerView.delegate = self;
        _pickerView.backgroundColor = XYGlobalUI.whiteColor;
        [self.contentView addSubview:_pickerView];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, _barHeight, self.width, 0.5)];
        line.backgroundColor = XYGlobalUI.lineColor;
        [self.contentView addSubview:line];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize size = self.frame.size;
    CGFloat h = _barHeight + _pickHeight + self.safeAreaInsetsEdge.bottom;
    self.contentView.frame = CGRectMake(0, size.height - h, size.width, h);
    _pickerView.frame = CGRectMake(0, _barHeight, size.width, _pickHeight);
    _cancelButton.frame = CGRectMake(15.0, 0, 120.0, _barHeight);
    _commitButton.frame = CGRectMake(size.width - 15.0 - 120.0, 0, 120.0, _barHeight);
    [_pickerView setNeedsLayout];
}

- (void)cancelButtonAction
{
    [super dismissWithCompletionBlock:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    self.completeBlock = nil;
}

- (void)commitButtonAction
{
    [super dismissWithCompletionBlock:^(BOOL finished) {
        if (self.completeBlock) {
            NSInteger index = [self.pickerView selectedRowInComponent:0];
            if (index >= 0) {
                NSString *value = self.datasource[index];
                self.completeBlock(value);
                self.completeBlock = nil;
            }
        }
        [self removeFromSuperview];
    }];
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _datasource.count;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _datasource[row];
}

- (void)setSeletedValue:(NSString *)seletedValue
{
    _seletedValue = seletedValue;
    
    for (NSString *value in _datasource) {
        if ([value isEqualToString:seletedValue]) {
            NSInteger index = [_datasource indexOfObject:value];
            [_pickerView selectRow:index inComponent:0 animated:NO];
            
            return;
        }
    }
}

@end
