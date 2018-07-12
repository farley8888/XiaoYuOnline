//
//  XYAssetGraphView.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/26.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "AssetGraphView.h"

const CGFloat XYASSET_GRAPH_CIRCLE_RADIUD = 67;

@implementation AssetGraphView {
    CAShapeLayer *_backCircleLayer;
    CAShapeLayer *_innerCircleLayer;
    CAShapeLayer *_indicatorLayer;
    CAShapeLayer *_circleLayer;
    double _angle;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commomInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commomInit];
    }
    return self;
}

- (void)commomInit {
    _valueLabel = [[UILabel alloc] init];
    _valueLabel.textColor = [UIColor whiteColor];
    _valueLabel.font = [UIFont systemFontOfSize:14];
    _valueLabel.textAlignment = NSTextAlignmentCenter;
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont systemFontOfSize:14];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    
    _backCircleLayer = [CAShapeLayer layer];
    _backCircleLayer.strokeColor = [UIColor whiteColor].CGColor;
    _backCircleLayer.fillColor = [UIColor clearColor].CGColor;
    _backCircleLayer.strokeStart = 0;
    _backCircleLayer.strokeEnd = 1.0;
    _backCircleLayer.lineWidth = 1.0;
    [self.layer addSublayer:_backCircleLayer];
    
    _indicatorLayer = [CAShapeLayer layer];
    _indicatorLayer.fillColor = [UIColor clearColor].CGColor;
    _indicatorLayer.strokeColor = [UIColor whiteColor].CGColor;
    _indicatorLayer.strokeStart = 0;
    _indicatorLayer.strokeEnd = 1.0;
    _indicatorLayer.lineWidth = 10;
    _indicatorLayer.lineCap = kCALineCapRound;
    [self.layer insertSublayer:_indicatorLayer above:_backCircleLayer];
    
    _innerCircleLayer = [CAShapeLayer layer];
    _innerCircleLayer.fillColor = [UIColor clearColor].CGColor;
    _innerCircleLayer.strokeColor = [UIColor orangeColor].CGColor;
    _innerCircleLayer.strokeStart = 0;
    _innerCircleLayer.strokeEnd = 0.5;
    _innerCircleLayer.lineWidth = 10.0;
    _innerCircleLayer.lineCap = kCALineCapRound;
    [self.layer insertSublayer:_innerCircleLayer above:_indicatorLayer];
    
    _circleLayer = [CAShapeLayer layer];
    _circleLayer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 10, 10) cornerRadius:5].CGPath;
    _circleLayer.fillColor = [UIColor orangeColor].CGColor;
    [self.layer addSublayer:_circleLayer];
    
    [self addSubview:_valueLabel];
    [self addSubview:_titleLabel];
    self.progress = 2 / 3.0;
    
    CGFloat innerH = 95.0;
    CGFloat h = XYASSET_GRAPH_CIRCLE_RADIUD - (XYASSET_GRAPH_CIRCLE_RADIUD * 2 - innerH);
    _angle = acosf(h / XYASSET_GRAPH_CIRCLE_RADIUD);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGPoint center = CGPointMake(CGRectGetWidth(self.frame) / 2.0, CGRectGetHeight(self.frame) / 2.0);
    _backCircleLayer.frame = self.bounds;
    _innerCircleLayer.frame = self.bounds;
    _indicatorLayer.frame = self.bounds;
    _valueLabel.bounds = CGRectMake(0, 0, XYASSET_GRAPH_CIRCLE_RADIUD * 2 - 15.0, 20.0);
    _valueLabel.center = center;
    
    
    double startAngle = M_PI_2 + _angle;
    double endAngle = M_PI_2 - _angle;
    
    _backCircleLayer.path = [UIBezierPath bezierPathWithArcCenter:center radius:center.x - 5 startAngle:0 endAngle:2 * M_PI clockwise:NO].CGPath;
    _indicatorLayer.path = [UIBezierPath bezierPathWithArcCenter:center radius:XYASSET_GRAPH_CIRCLE_RADIUD startAngle:startAngle endAngle:endAngle clockwise:YES].CGPath;
    _innerCircleLayer.path = [UIBezierPath bezierPathWithArcCenter:center radius:XYASSET_GRAPH_CIRCLE_RADIUD startAngle:startAngle endAngle:endAngle clockwise:YES].CGPath;

    CGFloat titleW = XYASSET_GRAPH_CIRCLE_RADIUD * sin(_angle) * 2 - 20;
    _titleLabel.bounds = CGRectMake(0, 0, titleW, 20);
    _titleLabel.center = CGPointMake(center.x, center.y + XYASSET_GRAPH_CIRCLE_RADIUD * cos(_angle));
    
    [self setCircleFrameWithProgress:_progress];
}

- (void)setProgress:(float)progress animate:(BOOL)animate {
    if (animate) {
        _progress = progress;
        [self setCircleFrameWithProgress:progress];
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        animation.fromValue = @(_innerCircleLayer.strokeEnd);
        animation.toValue = @(progress);
        animation.duration = 0.25;
        animation.fillMode = kCAFillModeForwards;
        
        _innerCircleLayer.strokeEnd = progress;
        [_innerCircleLayer addAnimation:animation forKey:@"animationProgress"];
    }
    else {
        self.progress = progress;
    }
}

#pragma mark - Setter

- (void)setProgress:(float)progress {
    _progress = progress;
    
    _innerCircleLayer.strokeEnd = progress;
    
    [self setCircleFrameWithProgress:progress];
}

- (void)setCircleFrameWithProgress:(float)progress {
    CGPoint center = CGPointMake(CGRectGetWidth(self.frame) / 2.0, CGRectGetHeight(self.frame) / 2.0);
    CGFloat innerRadius = XYASSET_GRAPH_CIRCLE_RADIUD - 20;

    double angleN = (M_PI * 2 - 2 * _angle) * progress + (M_PI_2 + _angle);
    CGFloat circleX = center.x + innerRadius * cos(angleN);
    CGFloat circleY = center.y + innerRadius * sin(angleN);
    _circleLayer.frame = CGRectMake(circleX, circleY, 10, 10);
}

@end
