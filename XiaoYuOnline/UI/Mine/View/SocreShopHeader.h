//
//  SocreShopHeader.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/7.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SocreShopHeader : UITableViewHeaderFooterView
@property (nonatomic, strong) UIImageView *titleImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@end

@interface XYCouponConvertHeader : SocreShopHeader
@property (nonatomic, strong) UILabel *descriptionLabel;
@end
