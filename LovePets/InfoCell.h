//
//  InfoCell.h
//  LovePets
//
//  Created by 于博洋 on 14/11/19.
//  Copyright (c) 2014年 yuby. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoViewController.h"

@interface InfoCell : UITableViewCell
{
    IBOutlet UIImageView * headImg;
}


@property (nonatomic,retain)InfoViewController * infoVC;

@end
