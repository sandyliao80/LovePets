//
//  MenusCell.m
//  LovePets
//
//  Created by apple on 14/11/18.
//  Copyright (c) 2014年 yuby. All rights reserved.
//

#import "MenusCell.h"
#import "PersonViewController.h"

@implementation MenusCell

- (void)awakeFromNib {
    // Initialization code
    
    headImage.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(headAction:)];
    [headImage addGestureRecognizer:tap];
    
}

- (void)headAction:(UITapGestureRecognizer *)tap
{
    PersonViewController * next = [[PersonViewController alloc]init];
    [self.menusVC.navigationController pushViewController:next animated:YES];
}

- (void)updataCellWithOrderInfo:(NSInteger)index
{
    // Configure the view for the selected state
    imgInfo.image = [UIImage imageNamed:[NSString stringWithFormat:@"cat%ld",(long)index%9]];
}

@end
