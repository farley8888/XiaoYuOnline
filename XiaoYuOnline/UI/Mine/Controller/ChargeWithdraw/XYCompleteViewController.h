//
//  XYCompleteViewController.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/7.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYBaseViewController.h"

@interface XYCompleteViewController : XYBaseViewController

@property (nonatomic, assign) BOOL success;
@property (nonatomic, copy) NSString *buttonTitle;
@property (nonatomic, copy) NSString *descriptText;
- (instancetype)initWithImage:(UIImage *)image title:(NSString *)title;

@end
