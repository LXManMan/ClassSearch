//
//  CustomSearchBar.m
//  hah
//
//  Created by lijun xue on 16/5/14.
//  Copyright © 2016年 chuanglong02. All rights reserved.
//

#define kHorizonal 15
#define kButtonWidth 15

#import "CustomSearchBar.h"

@implementation CustomSearchBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height;
        // 搜索框
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, width-15, height)];
        imageView.image = [UIImage imageNamed:@"sousuokuang"];
        [self addSubview:imageView];
        // 输入框
        self.textField = [[UITextField alloc] initWithFrame:CGRectMake(kHorizonal+15, 0, width-2*kHorizonal-kButtonWidth-15, height)];
        self.textField.placeholder = @"搜索课程";
        self.textField.font = [UIFont systemFontOfSize:14];
        [self.textField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
        [self addSubview:self.textField];
        // 搜索按钮
        self.searchButton = [[UIButton alloc] initWithFrame:CGRectMake(width-kHorizonal-kButtonWidth, 5, kButtonWidth, height-10)];
        [self.searchButton setBackgroundImage:[UIImage imageNamed:@"sousuo"] forState:(UIControlStateNormal)];
        [self addSubview:self.searchButton];
    }
    return self;
}

@end
