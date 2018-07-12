//
//  XYMineTableModel.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/8.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MineTableModel : NSObject
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, copy) NSString *title;

- (instancetype)initWithImage:(UIImage *)image title:(NSString *)title;

+ (NSArray<MineTableModel *> *)mineTableViewItemList;

@end
