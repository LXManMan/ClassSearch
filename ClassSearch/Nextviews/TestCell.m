//
//  TestCell.m
//  ClassSearch
//
//  Created by chuanglong02 on 16/10/18.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "TestCell.h"

@implementation TestCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setLxModel:(LXModel *)lxModel
{
    _lxModel = lxModel;
    self.titleLabel.text = lxModel.title;
    self.bodyLabel.text = lxModel.body;
}
@end
