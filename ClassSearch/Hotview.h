//
//  Hotview.h
//  hah
//
//  Created by chuanglong02 on 16/6/6.
//  Copyright © 2016年 chuanglong02. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HotViewDelegate<NSObject>
-(void)hotviewBtnClick:(UIButton *)button;
@end
@interface Hotview : UIView
@property(nonatomic,strong)UILabel *hotNoticeLabel;
@property(nonatomic,strong)NSMutableArray *buttonA;
@property(nonatomic,strong)NSMutableArray *btnTitleA;
@property(nonatomic,strong)id<HotViewDelegate>delegate;
@end
