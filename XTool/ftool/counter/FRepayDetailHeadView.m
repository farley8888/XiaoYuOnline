//
//  FRepayDetailHeadView.m
//  ZheJu
//
//  Created by apple on 2018/7/18.
//  Copyright © 2018年 ZheJu. All rights reserved.
//

#import "FRepayDetailHeadView.h"

@interface FRepayDetailHeadView ()
@property (nonatomic, weak) UILabel *textL;

@property (nonatomic, weak) UILabel *textM;

@property (nonatomic, weak) UILabel *textR;
@end
@implementation FRepayDetailHeadView



- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.contentView.backgroundColor = RGB(242,242,242);
        
        UILabel *label = [UILabel new];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = RGB(102,102,102);
        
        UILabel *label2 = [UILabel new];
        label2.textAlignment = NSTextAlignmentCenter;
        label2.font = [UIFont systemFontOfSize:14];
        label2.textColor = RGB(102,102,102);
        
        UILabel *label3 = [UILabel new];
        label3.textAlignment = NSTextAlignmentRight;
        label3.font = [UIFont systemFontOfSize:14];
        label3.textColor = RGB(102,102,102);
        
        [self.contentView addSubview:label];
        [self.contentView addSubview:label2];
        [self.contentView addSubview:label3];
        
        self.textL = label;
        self.textL.text = @"期号";
        
        self.textM = label2;
        self.textM.text = @"还款金额（元）";
        
        self.textR = label3;
        self.textR.text = @"还款时间";
    }
    return self;
}

- (void)setText:(NSString *)text
{
    self.textL.text = text;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    self.textL.frame = CGRectMake(25, 0, 50, self.bounds.size.height);
    
    self.textM.frame = CGRectMake(self.bounds.size.width/2 - 55, 0, 120, self.bounds.size.height);
    
    self.textR.frame = CGRectMake(self.bounds.size.width - 100 - 25, 0, 100, self.bounds.size.height);
    
}

@end
