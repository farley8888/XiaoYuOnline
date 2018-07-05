//
//  XYHomeSignView.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/12.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYHomeSignView.h"
#import "UIView+Common.h"
#import "FSCalendar.h"

static const NSUInteger kSignViewTag = 1200;

@interface XYHomeSignView ()<FSCalendarDelegate, FSCalendarDataSource>

@property (nonatomic, strong) FSCalendar *calendarView;
@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UIButton *signButton;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@property (nonatomic, strong) UIButton *previousButton;
@property (nonatomic, strong) UIButton *nextButton;
@property (nonatomic, strong) NSCalendar *gregorian;
@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) NSArray<NSDate *> *selectedDates;

@end

@implementation XYHomeSignView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _contentView = [[UIView alloc] init];
        _contentView.backgroundColor = XYGlobalUI.whiteColor;
        _contentView.layer.cornerRadius = 5.0;
        _contentView.clipsToBounds = YES;
    
        _calendarView = [[FSCalendar alloc] init];
        _calendarView.dataSource = self;
        _calendarView.delegate = self;
        _calendarView.today = [NSDate date];
        _calendarView.appearance.imageOffset = CGPointMake(0, -5);
        _calendarView.appearance.weekdayTextColor = XYGlobalUI.yellowColor;
        _calendarView.appearance.headerTitleColor = XYGlobalUI.yellowColor;
        _calendarView.appearance.todayColor = XYGlobalUI.whiteColor;
        _calendarView.appearance.titleTodayColor = XYGlobalUI.blackColor;
        _calendarView.appearance.headerDateFormat = @"yyyy 年 MM 月";
        
        _calendarView.calendarHeaderView.scrollDirection = UICollectionViewScrollDirectionVertical;
        _calendarView.backgroundColor = XYGlobalUI.whiteColor;
        
        _backgroundImageView = [[UIImageView alloc] init];
        
        _signButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_signButton setTitleColor:XYGlobalUI.whiteColor forState:UIControlStateNormal];
        [_signButton setTitle:NSLocalizedString(@"HomePage_SignNow", nil) forState:UIControlStateNormal];
        UIImage *img = [[UIImage imageNamed:@"main_btn_50diameter_bg"] stretchableImageWithLeftCapWidth:25 topCapHeight:25];
        [_signButton setBackgroundImage:img forState:UIControlStateNormal];
        [_signButton addTarget:self action:@selector(signButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeButton setImage:[UIImage imageNamed:@"home_sigh_close"] forState:UIControlStateNormal];
        [_closeButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        
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
        
        [self addSubview:_contentView];
        [_contentView addSubview:_calendarView];
        [_contentView addSubview:_backgroundImageView];
        [_contentView addSubview:_signButton];
        [_calendarView addSubview:_previousButton];
        [_calendarView addSubview:_nextButton];
        [_contentView addSubview:_closeButton];
        
        _contentView.alpha = 0;
        
        _dateFormatter = [[NSDateFormatter alloc] init];
        _dateFormatter.dateFormat = @"yyyy/MM/dd";
        _gregorian = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGSize size = self.frame.size;
    _contentView.frame = CGRectMake(0, 0, 320, 390);
    _contentView.center = CGPointMake(size.width / 2.0, size.height / 2.0);
    
    _calendarView.frame = CGRectMake(0, 0, 320, 300);
    _closeButton.frame = CGRectMake(323 - 35, 6, 30, 30);
    
    CGFloat safeW = 100.0, btnW = 40.0, gap = 2;
    CGFloat px = (_calendarView.width - safeW) / 2.0 - gap - btnW;
    CGFloat nx = _calendarView.width - px - btnW;
    _previousButton.frame = CGRectMake(px, 1, btnW, btnW);
    _nextButton.frame = CGRectMake(nx, 1, btnW, btnW);
    
    _signButton.frame = CGRectMake((size.width - 262.0) / 2.0, _calendarView.bottom + 17, 262.0, 50.0);
}

+ (XYHomeSignView *)signView {
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    UIView *tagView = [window viewWithTag:kSignViewTag];
    if (tagView) {
        return (XYHomeSignView *)tagView;
    } else {
        for (UIView *v in window.subviews) {
            if ([v isKindOfClass:[XYHomeSignView class]]) {
                v.tag = kSignViewTag;
                return (XYHomeSignView *)v;
            }
        }
    }
    
    XYHomeSignView *view = [[XYHomeSignView alloc] init];
    view.tag = kSignViewTag;
    
    return view;
}

- (void)show {
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    if (self == [window viewWithTag:kSignViewTag]) {
        return;
    }
    
    [window addSubview:self];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
        self.contentView.alpha = 1.0;
    }];
}

- (void)dismiss {
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    if (self == [window viewWithTag:kSignViewTag]) {
        [UIView animateWithDuration:0.25 animations:^{
            self.backgroundColor = [UIColor clearColor];
            self.contentView.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }
}

- (void)signButtonAction:(UIButton *)button {
    if ([self.delegate respondsToSelector:@selector(homeSignView:didPressSignButton:)]) {
        [self.delegate homeSignView:self didPressSignButton:button];
    }
}

- (void)previousButtonAction {
    NSCalendarUnit unit = (self.calendarView.scope==FSCalendarScopeMonth) ? NSCalendarUnitMonth : NSCalendarUnitWeekOfYear;
    NSDate *prevPage = [self.gregorian dateByAddingUnit:unit value:-1 toDate:self.calendarView.currentPage options:0];
    [self.calendarView setCurrentPage:prevPage animated:YES];
}

- (void)nextButtonAction {
    NSCalendarUnit unit = (self.calendarView.scope==FSCalendarScopeMonth) ? NSCalendarUnitMonth : NSCalendarUnitWeekOfYear;
    NSDate *nextPage = [self.gregorian dateByAddingUnit:unit value:1 toDate:self.calendarView.currentPage options:0];
    [self.calendarView setCurrentPage:nextPage animated:YES];
}

#pragma mark - <FSCalendarDataSource>


- (NSDate *)minimumDateForCalendar:(FSCalendar *)calendar {
    return [self.dateFormatter dateFromString:@"2017/10/01"];
}

- (NSDate *)maximumDateForCalendar:(FSCalendar *)calendar {
    return [NSDate date];
}

- (nullable UIImage *)calendar:(FSCalendar *)calendar imageForDate:(NSDate *)date {
    for (NSDate *theDate in _selectedDates) {
        NSDateComponents *theDateCom = [self.gregorian components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:theDate];
        NSDateComponents *dateCom = [self.gregorian components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date];
        if (theDateCom.year == dateCom.year &&
            theDateCom.month == dateCom.month &&
            theDateCom.day == dateCom.day) {
            return [UIImage imageNamed:@"home_sign_sel"];
        }
    }
    return nil;
}

- (BOOL)calendar:(FSCalendar *)calendar shouldSelectDate:(NSDate *)date atMonthPosition:(FSCalendarMonthPosition)monthPosition {
    return NO;
}

- (void)setSeletedDates:(NSArray<NSDate *> *)dates {
    _selectedDates = dates;
    [_calendarView reloadData];
}


@end
