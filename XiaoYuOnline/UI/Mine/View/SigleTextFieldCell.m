//
//  SigleTextFieldCell.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/6.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

//#import "SigleTextFieldCell.h"
#import "SigleTextFieldCell.h"

@implementation SigleTextFieldCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _textField = [[UITextField alloc] init];
        _textField.font = XYGlobalUI.smallFont_14;
        [self.contentView addSubview:_textField];
        
        UIView *line = [[UIView alloc] init];
        line.backgroundColor = XYGlobalUI.lineColor;
        [self.contentView addSubview:line];
        
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(5, 21.0, 5.0, 21.0));
        }];
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(self.contentView);
            make.height.mas_equalTo(XYGlobalUI.singleLineWidth);
        }];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
