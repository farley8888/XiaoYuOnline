//
//  WKSegementSliderView.m
//  Wookong
//
//  Created by wei.chen on 2018/2/27.
//  Copyright © 2018年 meta-insight.com. All rights reserved.
//

#import "WKSegementSliderView.h"

@interface WKSegementSliderView()

@property (nonatomic, strong) NSArray<NSString *> *titles;
@property (nonatomic, strong) NSArray<UIButton *> *titleButtons;
@property (nonatomic, strong) UIView *signBarView;
@property (nonatomic, assign) CGFloat itemWidth;

@end

@implementation WKSegementSliderView

- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame itemTitles:nil];
}

- (instancetype)initWithFrame:(CGRect)frame itemTitles:(NSArray<NSString *> *)titles
{
    self = [super initWithFrame:frame];
    if (self) {
        _normalTextColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
        _selectedTextColor = XYGlobalUI.whiteColor;
        _signBarColor = XYGlobalUI.whiteColor;
        _normalFont = XYGlobalUI.mainFont;
        _selectedFont = XYGlobalUI.mainFont;
        
        _titles = titles;
        
        [self loadSubviews];
    }
    return self;
}

- (void)loadSubviews
{
    _signBarView = [[UIView alloc] init];
    _signBarView.backgroundColor = _signBarColor;
    [self addSubview:_signBarView];
    
    NSMutableArray *titBtns = [NSMutableArray array];
    for (NSString *title in _titles) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.titleLabel.font = _normalFont;
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:_normalTextColor forState:UIControlStateNormal];
        [button setTitleColor:_selectedTextColor forState:UIControlStateSelected];
        [button addTarget:self action:@selector(buttonAtion:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [titBtns addObject:button];
    }
    _titleButtons = titBtns;
    if (_titles.count > 0) {
        _titleButtons[_selectedIndex].selected = YES;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat selfW = CGRectGetWidth(self.frame);
    CGFloat itemW = 0;
    if (_titles.count > 0) {
        itemW = selfW / _titles.count;
        _itemWidth = itemW;
    }
    CGFloat signBarH = 2.0;
    CGFloat signBarW = 30.0;
    
    if (!CGSizeEqualToSize(CGSizeZero, _signBarSize)) {
        signBarH = _signBarSize.height;
        signBarW = _signBarSize.width;
    }
    
    CGFloat itemH =CGRectGetHeight(self.frame) - signBarH;
    _signBarView.bounds = CGRectMake(0, 0, signBarW, signBarH);
    _signBarView.center = CGPointMake(itemW / 2.0 + _selectedIndex * itemW, itemH + signBarH / 2.0);
    
    for (NSUInteger i = 0, count = _titleButtons.count; i < count; i ++) {
        UIButton *btn = _titleButtons[i];
        btn.frame = CGRectMake(i * itemW, 0, itemW, itemH);
    }
}

#pragma mark - Event Response

- (void)buttonAtion:(UIButton *)button
{
    NSUInteger lastIndex = _selectedIndex;
    NSUInteger selected = [_titleButtons indexOfObject:button];
    if (lastIndex != selected) {
        [self setSelectedIndex:selected animate:YES];
        
        if ([self.delegate respondsToSelector:@selector(sliderSegementBar:didSeletedItemAtIndex: forward:)]) {
            [self.delegate sliderSegementBar:self didSeletedItemAtIndex:_selectedIndex forward:selected > lastIndex];
        }
    }
}

#pragma mrak - Setters

- (void)setNormalTextColor:(UIColor *)normalTextColor
{
    _normalTextColor = normalTextColor;
    
    for (UIButton *btn in _titleButtons) {
        [btn setTitleColor:_normalTextColor forState:UIControlStateNormal];
    }
}

- (void)setSelectedTextColor:(UIColor *)selectedTextColor
{
    _selectedTextColor = selectedTextColor;
    _signBarColor = selectedTextColor;
    _signBarView.backgroundColor = selectedTextColor;
    
    for (UIButton *btn in _titleButtons) {
        [btn setTitleColor:_selectedTextColor forState:UIControlStateSelected];
    }
}

- (void)setNormalFont:(UIFont *)normalFont
{
    _normalFont = normalFont;
    
    for (UIButton *btn in _titleButtons) {
        if (!btn.selected) {
            btn.titleLabel.font = normalFont;
        }
    }
}

- (void)setSelectedFont:(UIFont *)selectedFont
{
    _selectedFont = selectedFont;
    
    for (UIButton *btn in _titleButtons) {
        if (btn.selected) {
            btn.titleLabel.font = selectedFont;
            
            return;
        }
    }
}

- (void)setSignBarSize:(CGSize)signBarSize
{
    if (!CGSizeEqualToSize(signBarSize, _signBarView.frame.size)) {
        _signBarView.bounds = CGRectMake(0, 0, signBarSize.width, signBarSize.height);
        
        _signBarSize = signBarSize;
    }
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [self setSelectedIndex:selectedIndex animate:NO];
}

- (void)setSelectedIndex:(NSUInteger)index animate:(BOOL)animate
{
    if (_selectedIndex != index && index < _titleButtons.count) {
        UIButton *btnNew = _titleButtons[index];
        UIButton *btnLast = _titleButtons[_selectedIndex];
        btnNew.selected = YES;
        btnNew.titleLabel.font = _selectedFont;
        btnLast.selected = NO;
        btnLast.titleLabel.font = _normalFont;
        
        CGPoint center = _signBarView.center;
        center.x = _itemWidth / 2.0 + index * _itemWidth;
        if (animate) {
            [UIView animateWithDuration:0.25 animations:^{
                self.signBarView.center = center;
            }];
        } else {
            _signBarView.center = center;
        }
        
        _selectedIndex = index;
    }
}

@end
