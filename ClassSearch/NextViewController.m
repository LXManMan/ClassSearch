//
//  NextViewController.m
//  ClassSearch
//
//  Created by chuanglong02 on 16/10/18.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "NextViewController.h"
#import "LXModel.h"
#import "TestCell.h"
@interface NextViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)NSMutableArray *dataSource;
@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.tableview];
    [self.tableview registerNib:[UINib nibWithNibName:@"TestCell" bundle:nil] forCellReuseIdentifier:@"testCell"];
    [self configModel];

}
-(void)configModel
{
    NSArray *array =@[@"小明",@"小红",@"小张",@"小李",@"小声"];
    NSArray *desA = @[@"我就说你不行，你瞅啥",@"我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥",@"我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥",@"我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥",@"我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥"];
    for (int i = 0; i< array.count; i++) {
        LXModel *model =[[LXModel alloc]init];
        model.title = array[i];
        model.body = desA[i];
        [self.dataSource addObject:model];
    }
    
    [self.tableview reloadData];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView fd_heightForCellWithIdentifier:@"testCell" cacheByIndexPath:indexPath configuration:^(TestCell *cell) {
        cell.lxModel = self.dataSource[indexPath.row];
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TestCell *cell =[tableView dequeueReusableCellWithIdentifier:@"testCell"];
    if (!cell) {
        cell =[[TestCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"testCell"];
    }
    cell.lxModel = self.dataSource[indexPath.row];
    return  cell;
    
    
}
-(NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource =[NSMutableArray array];
    }
    return _dataSource;
}


-(UITableView *)tableview
{
    if (!_tableview) {
        _tableview =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, Device_Width, Device_Height - 64) style:UITableViewStylePlain];
        _tableview.delegate =  self;
        _tableview.dataSource = self;
        _tableview.showsVerticalScrollIndicator = NO;
        _tableview.showsHorizontalScrollIndicator = NO;
    }
    return _tableview;
}

@end
