//
//  XYWellBeingViewCell.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/6.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYWellBeingViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *contentImageView;

+ (CGFloat)rowHeight;

@end
