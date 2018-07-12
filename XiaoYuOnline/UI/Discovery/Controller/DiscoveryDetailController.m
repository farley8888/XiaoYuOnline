//
//  XYDiscoveryDetailController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/8.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "DiscoveryDetailController.h"
#import "TextInfoViewCell.h"
#import "ImageInfoViewCell.h"
#import "DiscoveryModel.h"
#import "DiscoveryDetailModel.h"
#import <UIImageView+WebCache.h>
#import "NSString+Common.h"

static NSString *discoveryTextReuseID = @"XYDiscoveryDetailTextCellReuseIdentfier";
static NSString *discoveryImageReuseID = @"XYDiscoveryDetailImageCellReuseIdentfier";

@interface DiscoveryDetailController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) NSMutableArray<DiscoveryDetailModel *> *infoList;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UIFont *cellTextFont;
@property (nonatomic, strong) DiscoveryModel *discoveryModel;
@end

@implementation DiscoveryDetailController

- (instancetype)initWithDiscoveryModel:(DiscoveryModel *)discoveryModel {
    self = [super init];
    if (self) {
        _discoveryModel = discoveryModel;
        _infoList = [NSMutableArray array];
        _cellTextFont = XYGlobalUI.smallFont_12;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = XYGlobalUI.backgroundColor;
    self.title = _discoveryModel.title;
    
    _tableView = [[UITableView alloc] init];
    _tableView.dataSource = self;
    _tableView.backgroundColor = XYGlobalUI.whiteColor;
    _tableView.delegate = self;
    _tableView.tableHeaderView = [self tableHeaderView];
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    footerView.backgroundColor = XYGlobalUI.whiteColor;
    _tableView.tableFooterView = footerView;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    [_tableView registerClass:[TextInfoViewCell class] forCellReuseIdentifier:discoveryTextReuseID];
    [_tableView registerClass:[ImageInfoViewCell class] forCellReuseIdentifier:discoveryImageReuseID];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    
    _leftImageView = [[UIImageView alloc] initWithImage:_discoveryModel.indicatorImage];
    
    [self loadUIContent];
}

- (void)loadUIContent {
    if (!_discoveryModel.discoveryID) {
        return;
    }
    
    __weak typeof(self) weakSelf = self;
    [self sendRequest:^(XMRequest * _Nonnull request) {
        request.api = Discovery_Detail_URL;
        request.httpMethod = kXMHTTPMethodGET;
        request.parameters = @{@"id" : weakSelf.discoveryModel.discoveryID, @"nid" : @"notice"};
    } showHUD:YES onSuccess:^(id  _Nullable responseObject) {
        NSLog(@"DiscoveryObject:%@", responseObject);
        CGFloat resW = SCREEN_WIDTH - 30.0;
        
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.lineSpacing = 4.0;
        NSDictionary *attDic = @{NSFontAttributeName : XYGlobalUI.smallFont_14, NSParagraphStyleAttributeName : style};
        for (NSDictionary *data in responseObject[@"content"]) {
            DiscoveryDetailModel *model = [[DiscoveryDetailModel alloc] initWithData:data restrictWidth:resW attribute:attDic];
            [weakSelf.infoList addObject:model];
        }
        [weakSelf.tableView reloadData];
    }];
}

- (UIView *)tableHeaderView {
    CGAffineTransform matrix =CGAffineTransformMake(1, 0, tanf(10 * (CGFloat)M_PI / 180), 1, 0, 0);
    UIFontDescriptor *desc = [ UIFontDescriptor fontDescriptorWithName :[UIFont systemFontOfSize:16].fontName matrix :matrix];
    UIFont *titleFont = [UIFont fontWithDescriptor:desc size:16.0];
    
    CGFloat titleH = [_discoveryModel.title stringHeightWithFont:titleFont restrictWidth:SCREEN_WIDTH - 18 * 2];
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 28 + titleH + 12 + 14 + 20)];
    contentView.clipsToBounds = YES;
    contentView.backgroundColor = [UIColor whiteColor];
    
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = XYGlobalUI.yellowColor;
    _titleLabel.font = titleFont;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.text = _discoveryModel.title;
    _titleLabel.numberOfLines = 2;
    
    _timeLabel = [[UILabel alloc] init];
    _timeLabel.font = XYGlobalUI.smallFont_12;
    _timeLabel.textAlignment = NSTextAlignmentCenter;
    _timeLabel.text = _discoveryModel.dateString;
    
    [contentView addSubview:_titleLabel];
    [contentView addSubview:_timeLabel];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentView).offset(28.0);
        make.left.equalTo(contentView).offset(18.0);
        make.right.equalTo(contentView).offset(-18.0);
    }];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(contentView).offset(18.0);
        make.right.equalTo(contentView).offset(-18.0);
        make.top.equalTo(self->_titleLabel.mas_bottom).offset(12.0);
    }];
    
    return contentView;
}

#pragma mark -
#pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _infoList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    DiscoveryDetailModel *model = _infoList[indexPath.row];
    
    if (model.infoType == XYInfoTypeText) {
        return model.contentHeight + 10.0;
    } else {
        return model.contentHeight + 20.0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DiscoveryDetailModel *model = _infoList[indexPath.row];
    if (model.infoType == XYInfoTypeText) {
        TextInfoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:discoveryTextReuseID forIndexPath:indexPath];
        cell.textLabel.attributedText = model.attributeContent;
        
        return cell;
    } else {
        ImageInfoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:discoveryImageReuseID forIndexPath:indexPath];
        [cell.contentImageView sd_setImageWithURL:[NSURL URLWithString:model.imageURL]];
        
        return cell;
    }
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
