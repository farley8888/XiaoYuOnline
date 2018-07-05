//
//  XYGuideViewController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/3.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYGuideViewController.h"
#import "XYRootViewController.h"

@interface XYGuideViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation XYGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *pictures = @[[UIImage imageNamed:@"guide_image_1"],
                          [UIImage imageNamed:@"guide_image_2"],
                          [UIImage imageNamed:@"guide_image_3"]
                          ];
    
    CGRect frame = [UIScreen mainScreen].bounds;
    _scrollView = [[UIScrollView alloc] initWithFrame:frame];
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.contentSize = CGSizeMake(CGRectGetWidth(frame) * pictures.count, CGRectGetHeight(frame));
    [self.view addSubview:_scrollView];
    
    UIImageView *lastImageView = nil;
    for (NSUInteger i = 0, count = pictures.count; i < count; i ++) {
        UIImageView *imgView = [[UIImageView alloc] initWithImage:pictures[i]];
        imgView.frame = CGRectMake(CGRectGetWidth(frame) * i, 0, CGRectGetWidth(frame), CGRectGetHeight(frame));
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        [_scrollView addSubview:imgView];
        lastImageView = imgView;
    }
    
    lastImageView.userInteractionEnabled = YES;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = XYGlobalUI.mainColor;
    button.layer.cornerRadius = 20.0;
    [button setTitle:@"立即体验" forState:UIControlStateNormal];
    button.bounds = CGRectMake(0, 0, 180, 50);
    button.center = CGPointMake(SCREEN_WIDTH / 2.0, SCREEN_HEIGHT - 30);
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [lastImageView addSubview:button];
}

- (void)buttonAction {
    XYRootViewController *vc = [[XYRootViewController alloc] init];
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    window.rootViewController = vc;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
