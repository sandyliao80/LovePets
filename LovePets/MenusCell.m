//
//  MenusCell.m
//  LovePets
//
//  Created by apple on 14/11/18.
//  Copyright (c) 2014年 yuby. All rights reserved.
//

#import "MenusCell.h"

@implementation MenusCell

- (void)awakeFromNib {
    // Initialization code
    
    headImage.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(headAction:)];
    [headImage addGestureRecognizer:tap];
    
}

- (void)headAction:(UITapGestureRecognizer *)tap
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
