//
//  HistoryCell.m
//  ClassSearch
//
//  Created by chuanglong02 on 16/10/17.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "HistoryCell.h"
@interface HistoryCell()
@property(nonatomic,strong)LxButton *historyBtn;
@property(nonatomic,strong)LxButton *deleteBtn;
@property(nonatomic,strong)UILabel  *contentLabel;
@property(nonatomic,strong)UIView   *bottomLine;
@property (nonatomic, strong) UILabel *lblTitle;
@property (nonatomic, strong) UILabel *lblBody;
@end
@implementation HistoryCell
-(void)setModel:(HistoryModel *)model
{
    _model = model;
//    self.contentLabel.text = model.showContent;
    self.lblTitle.text = @"哈哈哈哈";
//    [self upDateConStraints];
    self.lblBody.text  = model.showContent;
    
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle: style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
        [self setupConStraints];
    }
    return  self;
}
-(void)setupUI
{
//    [self.contentView addSubview:self.contentLabel];
//    [self.contentView addSubview:self.historyBtn];
//    [self.contentView addSubview:self.deleteBtn];
//    [self.contentView addSubview: self.bottomLine];
    [self.contentView addSubview:self.lblTitle];
    [self.contentView addSubview:self.lblBody];
    
}
-(void)setupConStraints
{
    
//    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.mas_equalTo(self.contentView);
//        make.height.mas_equalTo(@1);
//        make.bottom.mas_equalTo(self.contentView);
//    }];
//   [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//       make.centerY.mas_equalTo(self.contentView);
//       make.left.mas_equalTo(@20);
//       make.right.mas_equalTo(@-20);
//       make.bottom.mas_equalTo(self.bottomLine.mas_top).offset(5);
//   }];
    [self.lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(@20);
        make.right.equalTo(@-20);
        make.height.equalTo(@22);
    }];
    
    [self.lblBody mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.lblTitle);
        make.left.equalTo(self.lblTitle);
        make.top.mas_equalTo(self.lblTitle.mas_bottom).offset(10);
        make.bottom.equalTo(@-20);
    }];
    
}

-(LxButton *)historyBtn
{
    if (_historyBtn) {
        _historyBtn =[LxButton LXButtonNoFrameWithTitle:nil titleFont:nil Image:[UIImage imageNamed:@"history"] backgroundImage:nil backgroundColor:[UIColor greenColor] titleColor:nil];
    }
    return _historyBtn;
}
-(LxButton *)deleteBtn
{
    if (_deleteBtn) {
        _deleteBtn =[LxButton LXButtonNoFrameWithTitle:nil titleFont:nil Image:[UIImage imageNamed:@"buy_delete_pressed"] backgroundImage:nil backgroundColor:[UIColor redColor] titleColor:nil];
    }
    return _deleteBtn;
}
-(UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel =[UILabel LXLabelWithText:nil textColor:[UIColor purpleColor] backgroundColor:[UIColor blueColor] font:[UIFont systemFontOfSize:16.0] textAlignment:NSTextAlignmentLeft];
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}
-(UIView *)bottomLine
{
    if (!_bottomLine) {
        _bottomLine =[[UIView alloc]init];
        _bottomLine.backgroundColor =[UIColor brownColor];
    }
    return _bottomLine;
}
-(CGSize)stringSizeWithFont:(UIFont *)font string:(NSString *)string width:(CGFloat)width
{
    
    
    CGRect rect =[string boundingRectWithSize:CGSizeMake(width, 10000) options: NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return rect.size;
}
- (UILabel *)lblTitle {
    if (!_lblTitle) {
        _lblTitle = [UILabel new];
        _lblTitle.backgroundColor = [UIColor yellowColor];
    }
    return _lblTitle;
}

- (UILabel *)lblBody {
    if (!_lblBody) {
        _lblBody = [UILabel new];
        _lblBody.numberOfLines = 0;
        _lblBody.backgroundColor = [UIColor redColor];
    }
    return _lblBody;
}

@end
