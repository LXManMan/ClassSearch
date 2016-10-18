//
//  Hotview.m
//  hah
//
//  Created by chuanglong02 on 16/6/6.
//  Copyright © 2016年 chuanglong02. All rights reserved.
//

#import "Hotview.h"
#import "HotWords.h"
#define btnH 30
@implementation Hotview

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat hotW = frame.size.width;
        self.buttonA =[NSMutableArray array];
        self.hotNoticeLabel =[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 150, 20)];
        self.hotNoticeLabel.text = @"搜索类别";
        self.hotNoticeLabel.textColor = [UIColor redColor];
        self.hotNoticeLabel.font =[UIFont systemFontOfSize:14.0];
        [self addSubview:self.hotNoticeLabel];
       
        CGFloat BtnY = CGRectGetMaxY(self.hotNoticeLabel.frame)+5;
        for (int i  =0; i<3; i++) {
            UIView *view =[[UIView alloc]initWithFrame:CGRectMake(hotW/3 *i, BtnY, hotW/3, btnH)];
            [self addSubview:view];
            UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
            button.layer.borderColor = [UIColor colorWithRed:1.000 green:0.580 blue:0.302 alpha:1.000].CGColor;
            button.layer.cornerRadius = btnH/2;
            button.layer.borderWidth = 1;
            button.tag = 1000+ i;
            button.titleLabel.font =[UIFont systemFontOfSize:15];
            [button addTarget:self action:@selector(hotBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            button.layer.masksToBounds = YES;
            [view addSubview:button];
            [self.buttonA addObject:button];
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(view.mas_centerY);
                make.centerX.mas_equalTo(view.mas_centerX);
                make.size.mas_equalTo(CGSizeMake(60, btnH));
            }];
            
        }
        BtnY += btnH+10;
        for (int i =0 ; i<2; i++) {
            UIView *view =[[UIView alloc]initWithFrame:CGRectMake(hotW/2 *i, BtnY, hotW/2, btnH)];
            //            view.backgroundColor =LBRandomColor;
            [self addSubview:view];
            UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
            button.layer.borderColor = [UIColor colorWithRed:1.000 green:0.580 blue:0.302 alpha:1.000].CGColor;
            button.titleLabel.font =[UIFont systemFontOfSize:15];
            button.layer.cornerRadius = btnH/2;
            button.layer.borderWidth = 1;
            button.layer.masksToBounds = YES;
             button.tag = 2000+ i;
            [button addTarget:self action:@selector(hotBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.buttonA addObject:button];
            [view addSubview:button];
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(view.mas_centerY);
                make.centerX.mas_equalTo(view.mas_centerX);
                make.size.mas_equalTo(CGSizeMake(60, btnH));
            }];
            
        }
       
       
    }
    return  self;
}
-(void)setBtnTitleA:(NSArray *)btnTitleA
{
    for (int i = 0; i < self.buttonA.count; i++) {
        UIButton *button = self.buttonA[i];
        HotWords *hotTitle = btnTitleA[i];
        [button setTitle:hotTitle.name forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:1.000 green:0.580 blue:0.302 alpha:1.000] forState:UIControlStateNormal];
    }
}
-(void)hotBtnClick:(UIButton *)btn
{
    switch (btn.tag) {
        case 1000:
             [[NSUserDefaults standardUserDefaults] setObject:@"T004" forKey:@"buttonNum"];
            break;
        case 1001:
            [[NSUserDefaults standardUserDefaults] setObject:@"T005" forKey:@"buttonNum"];
            break;

        case 1002:
            [[NSUserDefaults standardUserDefaults] setObject:@"T006" forKey:@"buttonNum"];
            break;

        case 2000:
            [[NSUserDefaults standardUserDefaults] setObject:@"T007" forKey:@"buttonNum"];
            break;

        case 2001:
            [[NSUserDefaults standardUserDefaults] setObject:@"T008" forKey:@"buttonNum"];
            break;

       

        default:
            break;
    }
    [self.delegate hotviewBtnClick:btn];
}
@end
