//
//  HistoryViewController.m
//  ClassSearch
//
//  Created by chuanglong02 on 16/10/18.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "HistoryViewController.h"
#import "HistoryModel.h"
#import "HistoryRecordCell.h"
@interface HistoryViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *historyTableview;
@property(nonatomic,strong)NSMutableArray *dataA;
@end

static NSString *historyIndentifier = @"historyIndentifier";
@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.historyTableview];

    self.historyTableview.tableFooterView =[UIView new];
    [self.historyTableview registerNib:[UINib nibWithNibName:@"HistoryRecordCell" bundle:nil] forCellReuseIdentifier:historyIndentifier];
    NSArray *contentA = @[@"小时候生病，妈妈总会泡杯咖啡，说：“外国人都喝这的。”我一直都比较害怕咖啡，苦涩交加。长大了，我走遍星巴克、上岛，都找不到小时候喝的那个味。直到某天，我喝到了板蓝根……",@"今天和老公看电影，前排坐着两个妹子，一人手里抱着一大桶爆米花，从电影开场就一直在吃。吃完后，两人又拿出一大袋瓜子开始嗑。说实话，烦得我恨不得骂街，但是我忍住了。我对老公说：“把鞋脱了吧！”",@"有个同学去非洲援建，刚到工地接待他的施工员是个黑人，他就用英语跟人家交流，黑人没做声。然后他又用法语，黑人还是没说话。然后他用手去比划。黑人终于开口了：瞎比划嘎哈，整个工地都中国人！同学……………",@"同学们问班主任：“您想让我们在明天的毕业晚会上做些什么特别的事情吗？班主任回答：“不要你们做别的，大家在晚会上光彩照人就行！”第二天，赵仁同学在晚会中被活活踩死了。",@"世间还是好人多呀！！ 今出门坐公交，车来了，一掏兜没零钱，正一筹莫展之时，一个乞讨者站到了我面前，把手中的钱缸伸向了我，晃了晃里面的零钱，我摇摇头，他还是坚持的伸过来再次摇了摇缸子！一瞬间我的眼睛湿润了，我冲他点了点头，从里面拿了一块钱登上了缓缓启动的公交。站在车上，我看着车外的他一边追赶着车一边在喊什么，我再也控制不住了，猛的打开车窗大声喊：“谢谢你大哥，一块钱就够了，这不是空调车”。说完我关上了车窗，心情久久不能平静！！",@"iPhone6S最近降价，小明买了一部，高高兴兴滴回家，结果过桥时手滑，手机掉到了河里，小明哇哇大哭。不一会儿，上来一个老人，自称是河神，拿着一部iPhone 7和一部iPhone 7 Plus，还都是256GB亮黑色，问：“小朋友，哪个是你的啊？”小明摇了摇头：“都不是，我买的是iPhone 6S。”河神笑了：“真是个诚实的孩子，这两部手机你也一并拿去吧。”小明回村后给村里人讲了这件事，小王同学听了受到启发，就拿了一部三星Note 7跑到桥边，假装摔了一跤，“噗通”手机掉下河，只听一声巨响，湖中泛起蓝光，一朵蘑菇云冲天而起，河水一滴不剩，隐约看到湖底躺着一位衣衫褴褛奄奄一息的老者"];
    
    
    for (NSString *string in contentA) {
        HistoryModel *model =[[HistoryModel alloc]init];
        model.showContent = string;
        [self.dataA addObject:model];
    }
    [self.historyTableview reloadData];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.dataA.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HistoryRecordCell *cell =[tableView dequeueReusableCellWithIdentifier:historyIndentifier];
    if (!cell) {
        cell =[[HistoryRecordCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:historyIndentifier];
    }
    cell.historyModel = self.dataA[indexPath.row];

    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  [tableView fd_heightForCellWithIdentifier:historyIndentifier cacheByIndexPath:indexPath configuration:^(HistoryRecordCell  *cell) {
        cell.historyModel = self.dataA[indexPath.row];
        
    }];
}
-(NSMutableArray *)dataA
{
    if (!_dataA ) {
        _dataA =[NSMutableArray array];
    }
    return _dataA;
}
-(UITableView *)historyTableview
{
    if (!_historyTableview) {
        _historyTableview =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, Device_Width, Device_Height - 64) style:UITableViewStylePlain];
        _historyTableview.delegate = self;
        _historyTableview.dataSource = self;
        _historyTableview .showsHorizontalScrollIndicator = NO;
        _historyTableview.showsVerticalScrollIndicator = NO;
        
    }
    return _historyTableview;
}
@end
