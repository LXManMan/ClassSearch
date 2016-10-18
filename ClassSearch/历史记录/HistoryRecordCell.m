//
//  HistoryRecordCell.m
//  ClassSearch
//
//  Created by chuanglong02 on 16/10/18.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "HistoryRecordCell.h"

@implementation HistoryRecordCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setHistoryModel:(HistoryModel *)historyModel
{
    _historyModel = historyModel;
    self.contentLabel.text = historyModel.showContent;
}
@end
