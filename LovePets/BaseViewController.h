//
//  BaseViewController.h
//  LovePets
//
//  Created by apple on 14/11/18.
//  Copyright (c) 2014年 yuby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property(nonatomic,retain)UIButton *leftBtn;
@property(nonatomic,retain)UIButton *rightBtn;
@property(nonatomic,assign)float navHeight;

@property (nonatomic,retain) UILabel * labTitle;

@end
