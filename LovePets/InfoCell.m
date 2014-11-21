//
//  InfoCell.m
//  LovePets
//
//  Created by 于博洋 on 14/11/19.
//  Copyright (c) 2014年 yuby. All rights reserved.
//

#import "InfoCell.h"
#import "PersonViewController.h"

@implementation InfoCell

- (void)awakeFromNib {
    // Initialization code
    headImg.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(jumoPerson:)];
    [headImg addGestureRecognizer:tap];
    headImg.image = [UIImage imageNamed:@"cat9"];
}

-(void)jumoPerson:(UITapGestureRecognizer *)tap
{
    PersonViewController * next = [[PersonViewController alloc]init];
    [self.infoVC.navigationController pushViewController:next animated:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
}

@end
