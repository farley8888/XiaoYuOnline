//
//  ImageInfoViewCell.m
//  XiaoYuOnline
//
//  Created by ChenWei on 2018/5/10.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "ImageInfoViewCell.h"

@implementation ImageInfoViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _contentEdge = UIEdgeInsetsMake(10, 15, 10, 15);
        _contentImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_contentImageView];
        
        [_contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.contentEdge);
        }];
    }
    return self;
}

//- (void)layoutSubviews {
//    [super layoutSubviews];
//    CGSize size = self.bounds.size;
//    self.imageView.frame = CGRectMake(_contentEdge.left, _contentEdge.top, size.width - _contentEdge.left - _contentEdge.right, size.height - _contentEdge.top - _contentEdge.bottom);
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
