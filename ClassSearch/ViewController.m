//
//  ViewController.m
//  ClassSearch
//
//  Created by chuanglong02 on 16/10/17.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "ViewController.h"
#import "AddClassSearchController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   
    LxButton *button =[LxButton LXButtonWithTitle:@"点我" titleFont:[UIFont systemFontOfSize:16.0] Image:nil backgroundImage:nil backgroundColor:[UIColor purpleColor] titleColor:[UIColor blackColor] frame:CGRectMake(20, 100, 100, 40)];
    [self.view addSubview:button];
     __weak ViewController *weakSelf  = self;
    [button addClickBlock:^(UIButton *button) {
        [weakSelf.navigationController pushViewController:[[AddClassSearchController alloc]init] animated:YES];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
