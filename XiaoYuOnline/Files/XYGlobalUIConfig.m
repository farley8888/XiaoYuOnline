//
//  OLGlobalUIConfig.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/5.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "OLGlobalUIConfig.h"
#import "UIColor+Helper.h"

@interface OLGlobalUIConfig()

@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, strong) UIFont *mainFont;
@property (nonatomic, strong) UIFont *mainBoldFont;
@property (nonatomic, strong) UIFont *smallFont_14;
@property (nonatomic, strong) UIFont *smallBoldFont_14;
@property (nonatomic, strong) UIFont *smallFont_12;
@property (nonatomic, strong) UIFont *smallFont_9;

@property (nonatomic, strong) UIColor *mainColor;
@property (nonatomic, strong) UIColor *yellowColor;
@property (nonatomic, strong) UIColor *blackColor;
@property (nonatomic, strong) UIColor *whiteColor;
@property (nonatomic, strong) UIColor *grayColor;
@property (nonatomic, strong) UIColor *lightGrayColor;
@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, strong) UIColor *redColor;
@property (nonatomic, strong) UIColor *backgroundColor;

@end

@implementation OLGlobalUIConfig

- (void)setup
{
    // Font
    _titleFont = [UIFont systemFontOfSize:20.0];
    _mainFont = [UIFont systemFontOfSize:17.0];
    _mainBoldFont = [UIFont boldSystemFontOfSize:17.0];
    _smallFont_14 = [UIFont systemFontOfSize:14.0];
    _smallBoldFont_14 = [UIFont boldSystemFontOfSize:14.0];
    _smallFont_12 = [UIFont systemFontOfSize:12.0];
    _smallBoldFont_12 = [UIFont boldSystemFontOfSize:12.0];
    _smallFont_9 = [UIFont systemFontOfSize:9];
    
    // Color
    _mainColor = RGB_COLOR(238, 134, 79);
    _yellowColor = RGB_COLOR(255, 166, 82);
    _blackColor = [UIColor colorWithHexString:@"#485065"];
    _whiteColor = RGB_COLOR(255, 255, 255);
    _greenColor = RGB_COLOR(33, 160, 12);
    _lightGrayColor = [UIColor colorWithHexString:@"#BCBCBC"];
    _grayColor = [UIColor colorWithHexString:@"#D0D0D0"];
    _blueColor = [UIColor colorWithHexString:@"#00ACF0"];
    _redColor = [UIColor colorWithHexString:@"#D0422B"];
    _lineColor = _lightGrayColor;
    _backgroundColor = RGB_COLOR(245, 245, 245);
    _lightBlcakColor = RGB_COLOR(58, 58, 58);
    
    _screenSize = [UIScreen mainScreen].bounds.size;
    _singleLineWidth = 1 / [UIScreen mainScreen].scale;
    _yellowButtonBackgroundImage = [[UIImage imageNamed:@"button_yellow_bg"] stretchableImageWithLeftCapWidth:30 topCapHeight:30];
}

+ (instancetype)shareInstance
{
    static OLGlobalUIConfig *config;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [[OLGlobalUIConfig alloc] init];
        [config setup];
    });
    return config;
}

- (UIImage *)stretchCorner5ImageWithName:(NSString *)name; {
    return [[UIImage imageNamed:name] stretchableImageWithLeftCapWidth:5 topCapHeight:5];
}

@end
