//
//  DiscoveryModel.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/7.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "DiscoveryModel.h"
#import <YYKit/NSDictionary+YYAdd.h>

@implementation DiscoveryModel

- (instancetype)initWithDiscoveryApiData:(NSDictionary *)data {
    NSString *title = [data stringValueForKey:@"title" default:nil];
    NSString *content = [data stringValueForKey:@"content" default:nil];
    NSString *descri = [data stringValueForKey:@"introduction" default:nil];
    NSString *time = [data stringValueForKey:@"addDate" default:nil];
    NSString *disID = [data stringValueForKey:@"id" default:nil];
    
    self = [self initWithTitle:title content:content description:descri];
    if (self) {
        _dateString = time;
        _discoveryID = disID;
        
        NSArray *names = @[@"discovery_deepRed_bg", @"discovery_red_bg", @"discovery_yellow_bg", @"discovery_yellow_bg", @"discovery_blue_bg", @"discovery_green_bg"];
        int index = arc4random() % names.count;
        _indicatorImage = [[UIImage imageNamed:names[index]] resizableImageWithCapInsets:UIEdgeInsetsMake(15, 13, 15, 10) resizingMode:UIImageResizingModeStretch];
    }
    
    return self;
}

+ (NSArray<DiscoveryModel *>*)discoveryMainDatasourceList {
    NSMutableArray *marr = [NSMutableArray array];
    NSArray *names = @[@"discovery_deepRed_bg", @"discovery_red_bg", @"discovery_yellow_bg", @"discovery_yellow_bg", @"discovery_blue_bg", @"discovery_green_bg"];
    
    for (NSUInteger i = 0, count = 50; i < count; i ++) {
        DiscoveryModel *model = [[DiscoveryModel alloc] initWithTitle:@"实时资讯" content:@"这里是实时资讯" description:@"4月5日，吉卜力工作室创始人之一，日本动画大师高畑勋因肺癌在东京都内医院逝世，享年82岁。据悉，高畑勋导演自去年夏天起便身体不适，其间反复住院，最终还是遗憾离世。高畑勋是当今日本最重要的动画巨匠之一，也是著名导演岩井俊二的姑父。学生时代的高畑勋观看了《邪眼暴君》（1952年）一片后大受触动，决心从事动画事业。在东京大学法文科毕业后，高畑勋加入了东映动画。在东映，高畑勋与宫崎骏相识，从此展开长期合作。\n\n1985年，两人合伙创立了吉卜力工作室，开启了日本动画的一个崭新时代。虽然在中国，他远没有宫崎骏名气大，但他对日本动画的贡献却有目共睹。他将自然主义带到日本动画中，自然地讲述日常生活，在叙事上具有明显的散文化特征。他的动画题材大都来自于文学、历史或现实生活，相对于宫崎骏的天马行空、神奇瑰丽，高畑勋的动画平实而又生活化\n\n1935年，高畑勋出生于日本三重县伊势市，父亲浅次郎是当地著名教育家。或许是遗传了父亲的基因，高畑勋和两个兄弟也都是“学霸”：兄弟三人都毕业于东京大学。或许是因为出生于这样的家庭，高畑勋做任何事都带有学者式的钻研劲头，热衷于对每个细节刨根问底，特别是在制作动画电影中，更是发挥到了极致。不同于宫崎骏的天马行空，高畑勋向往的是“日常生活”，并且力求在电影中做到百分之百的准确自然，当然这是极其耗时的。\n\n《萤火虫之墓》中有一个神户遭受空袭的场景，高畑勋为了确定“从主人公清太的家向上看的话，飞机从哪个方向飞过来？”查遍了能找到的所有的那个年代的资料，最后成功使飞机的方位和飞行的方向与历史的真实情况保持了一致。\n\n宫崎骏做事很有决断力，《起风了》的电影海报，他只用了5秒就决定了。在创作的时候，他也可以一边画分镜头，一边跟人聊天；而高畑勋则是另一种状态：每天都会在迟到的前一刻进公司，一进门就猛喝水和猛啃面包，是个超爱赖床的天生懒人。1985年，两人合伙成立了吉卜力工作室，工作室成立的初衷是“双头并行制”，宫崎骏和高畑勋各领一组人马，间隔推出新作，这样可以保证工作室每年都有新作问世。然而，“理想很丰满，现实很骨感”，本来打算于1987年上映的《萤火虫之墓》，由于导演高畑勋的拖延被延期到1988年上映，和宫崎骏的《龙猫》打对台，结果两边票房都不好。其实，《萤火虫之墓》在第一轮公映时是以“未完成状态”公映的，画面有两处出现空白。到了一个半月后的第二轮公映，完整的全片才制作完成。\n\n拖延症的毛病一直伴随高畑勋的职业生涯。在合作《百变狸猫》时，影片本来预计当年夏季上映，但是为了对付高畑勋的拖延症，铃木敏夫伪造了一款春季公映的海报给高畑勋看，告诉他，春天一定要把片子做好。结果，春天果然没有做完。高畑勋说如果改在夏天公映的话，不剪掉十分钟仍然做不完。最后铃木敏夫将电影剪掉了十分钟才赶上了公映档期。很多人夸铃木敏夫“了不起”，因为从来没有哪个制片人可以连着帮高畑勋做两部作品，而他在《百变狸猫》之前，已经做了《萤火虫之墓》和《岁月的童话》。正是因为有之前的不断磨合，铃木敏夫说，不论高畑勋提出什么要求，他都“见怪不怪”。"];
        
        int index = i % names.count;
        model.indicatorImage = [[UIImage imageNamed:names[index]] resizableImageWithCapInsets:UIEdgeInsetsMake(15, 13, 15, 10) resizingMode:UIImageResizingModeStretch];
        model.dateString = @"2018-1-29日 05:36";
        [marr addObject:model];
    }
    return marr;
}

@end
