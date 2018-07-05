//
//  XYLoanDescriptionCell.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/12.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYLoanViewCell.h"

@interface XYLoanDescriptionCell : XYLoanViewCell<UITextViewDelegate>

@property (nonatomic, strong) UIButton *accessoryButton;
@property (nonatomic, strong) UIImageView *bakcgroundImageView;
@property (nonatomic, strong) UILabel *descriptLabel;
@property (nonatomic, strong) UITextView *textView;

@end
