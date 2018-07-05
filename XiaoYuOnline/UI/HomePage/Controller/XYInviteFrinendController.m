//
//  XYInviteFrinendController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/5/13.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYInviteFrinendController.h"

@interface XYInviteFrinendController ()

@end

@implementation XYInviteFrinendController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSLocalizedString(@"HomePage_Invite", nil);
    self.tableView.tableHeaderView = [self tableHeaderView];
    self.tableView.sectionHeaderHeight = SCREEN_WIDTH * (31.0 / 690);
    self.tableView.backgroundColor = RGB_COLOR(248, 237, 199);
}

- (UIView *)tableHeaderView {
    CGFloat imgH = SCREEN_WIDTH * (579.0 / 690);
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, imgH + 100)];
    view.backgroundColor = RGB_COLOR(253, 250, 240);
    
    UIImageView *imgTop = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, imgH)];
    imgTop.image = [UIImage imageNamed:@"inviteFriends_top"];
    [view addSubview:imgTop];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *img = [[UIImage imageNamed:@"main_btn_40diameter_bg"] stretchableImageWithLeftCapWidth:20 topCapHeight:20];
    button.titleLabel.font = XYGlobalUI.smallFont_14;
    [button setBackgroundImage:img forState:UIControlStateNormal];
    [button setTitleColor:XYGlobalUI.whiteColor forState:UIControlStateNormal];
    [button setTitle:NSLocalizedString(@"HomePage_InviteNow", nil) forState:UIControlStateNormal];
    [button addTarget:self action:@selector(inviteFriendButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    button.frame = CGRectMake(0, 0, 200, 40.0);
    button.center = CGPointMake(SCREEN_WIDTH / 2.0, CGRectGetMaxY(imgTop.frame) + 50.0);
    
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"inviteFriends_bottom"]];
}

#pragma mark - EventResponse

- (void)inviteFriendButtonAction {
    
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
