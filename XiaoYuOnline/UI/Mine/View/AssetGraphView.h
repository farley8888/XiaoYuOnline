//
//  XYAssetGraphView.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/26.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <UIKit/UIKit.h>

// 资产图表
@interface AssetGraphView : UIView

@property (nonatomic, strong) UILabel *valueLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, assign) float progress;

- (void)setProgress:(float)progress animate:(BOOL)animate;
@end
