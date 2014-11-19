//
//  ChatCell.m
//  LovePets
//
//  Created by apple on 14/11/19.
//  Copyright (c) 2014年 yuby. All rights reserved.
//

#import "ChatCell.h"

@implementation ChatCell

- (void)awakeFromNib {
    // Initialization code
    userHead.layer.cornerRadius = 4;
    userHead.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
