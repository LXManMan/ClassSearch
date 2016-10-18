//
//  AddClassSearchController.m
//  ClassSearch
//
//  Created by chuanglong02 on 16/10/17.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "AddClassSearchController.h"
#import "CustomSearchBar.h"
#import "Hotview.h"
#import "HotWords.h"
#import "HistoryCell.h"
#import "HistoryModel.h"
#import "NextViewController.h"
#define HOTVIEWH 115
@interface AddClassSearchController ()<UITableViewDelegate,UITableViewDataSource,HotViewDelegate>
@property(nonatomic,strong)CustomSearchBar *searchBar;
@property(nonatomic,strong)Hotview *hotView;
@property(nonatomic,strong)UITableView *historyTableview;
@property(nonatomic,strong)NSMutableArray *historyData;
@end

@implementation AddClassSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = MainColor;
    [self setupUI];
    
}
-(void)setupUI
{
    //左侧返回
    UIButton *backBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 30 , 30);
    [backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];

    //搜索框
    self.navigationItem.titleView = self.searchBar;
    //热词
    [self.view addSubview:self.hotView];
    
    //搜索记录
    [self.view addSubview:self.historyTableview];
    

    HistoryModel *model =[[HistoryModel alloc]init];
    model.showContent = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent non quam ac massa viverra semper. Maecenas mattis justo ac augue volutpat congue. Maecenas laoreet, nulla eu faucibus gravida, felis orci dictum risus, sed sodales sem eros eget risus. Morbi imperdiet sed diam et sodales. Vestibulum ut est id mauris ultrices gravida. Nulla malesuada metus ut erat malesuada, vitae ornare neque semper. Aenean a commodo justo, vel placerat odio. Curabitur vitae consequat tortor. Aenean eu magna ante. Integer tristique elit ac augue laoreet, eget pulvinar lacus dictum. Cras eleifend lacus eget pharetra elementum. Etiam fermentum eu felis eu tristique. Integer eu purus vitae turpis blandit consectetur. Nulla facilisi. Praesent bibendum massa eu metus pulvinar, quis tristique nunc commodo. Ut varius aliquam elit, a tincidunt elit aliquam non. Nunc ac leo purus. Proin condimentum placerat ligula, at tristique neque scelerisque ut. Suspendisse ut congue enim. Integer id sem nisl. Nam dignissim, lectus et dictum sollicitudin, libero augue ullamcorper justo, nec consectetur dolor arcu sed justo. Proin rutrum pharetra lectus, vel gravida ante venenatis sed. Mauris lacinia urna vehicula felis aliquet venenatis. Suspendisse non pretium sapien. Proin id dolor ultricies, dictum augue non, euismod ante. Vivamus et luctus augue, a luctus mi. Maecenas sit amet felis in magna vestibulum viverra vel ut est. Suspendisse potenti. Morbi nec odio pretium lacus laoreet volutpat sit amet at ipsum. Etiam pretium purus vitae tortor auctor, quis cursus metus vehicula. Integer ultricies facilisis arcu, non congue orci pharetra quis. Vivamus pulvinar ligula neque, et vehicula ipsum euismod quis.";
    [self.historyData addObject:model];
    [self.historyTableview reloadData];
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.historyData.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HistoryCell *cell =[tableView dequeueReusableCellWithIdentifier:@"SearchCell"];
    if (!cell) {
        cell =[[HistoryCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SearchCell"];
    }
  HistoryModel *model = self.historyData[indexPath.row];
    cell.model = model;
    cell.backgroundColor =[UIColor redColor];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView fd_heightForCellWithIdentifier:@"SearchCell" cacheByIndexPath:indexPath configuration:^(HistoryCell *cell) {
        cell.model = self.historyData[indexPath.row];
    }];
//    return 200;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self nextVC];
}
#pragma mark---返回到上个界面----
-(void)backAction:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark---点击热词代理方法---
-(void)hotviewBtnClick:(UIButton *)button
{
    [self nextVC];

}
-(void)nextVC
{
    NextViewController *ViewVC =[[NextViewController alloc]init];
    ViewVC.view.backgroundColor =[UIColor purpleColor];
    [self.navigationController pushViewController:ViewVC animated:YES];
}
#pragma mark---懒加载----
-(CustomSearchBar *)searchBar
{
    if (!_searchBar) {
        _searchBar =[[CustomSearchBar alloc]initWithFrame:CGRectMake(60, 0, Device_Width - 120, 30)];
        
    }
    return _searchBar;
}
-(Hotview *)hotView
{
    if (!_hotView) {
        _hotView =[[Hotview alloc]initWithFrame:CGRectMake(0, 0, Device_Width, HOTVIEWH)];
        _hotView.backgroundColor = [UIColor whiteColor];
        _hotView.delegate = self;

        NSMutableArray *btnTitleA=[NSMutableArray array];
        NSMutableArray *titles= [NSMutableArray arrayWithObjects:@"衣服",@"鞋子",@"帽子",@"裤子",@"袜子", nil];
        for (int i = 0; i<titles.count; i++) {
            HotWords *hotWords = [[HotWords alloc]init];
            hotWords.name = titles[i];
            [btnTitleA addObject:hotWords];
        }
        _hotView.btnTitleA = btnTitleA;
    }
    return _hotView;
}
-(UITableView *)historyTableview
{
    if (!_historyTableview) {
        _historyTableview =[[UITableView alloc]initWithFrame:CGRectMake(0, HOTVIEWH, Device_Width, Device_Height - 64 - HOTVIEWH) style:UITableViewStylePlain];
        _historyTableview.delegate = self;
        _historyTableview.dataSource = self;
        _historyTableview.showsVerticalScrollIndicator = NO;
        _historyTableview.showsHorizontalScrollIndicator = NO;
        _historyTableview.tableFooterView =[UIView new];
        [_historyTableview registerClass:[HistoryCell class] forCellReuseIdentifier:@"SearchCell"];
        _historyTableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _historyTableview;
}
-(NSMutableArray *)historyData{
    if (!_historyData) {
        _historyData =[NSMutableArray array];
    }
    return _historyData;
}
@end
