//
//  HistoryRecordCell.h
//  ClassSearch
//
//  Created by chuanglong02 on 16/10/18.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HistoryModel.h"
@interface HistoryRecordCell : UITableViewCell
@property(nonatomic,strong)HistoryModel *historyModel;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@end
