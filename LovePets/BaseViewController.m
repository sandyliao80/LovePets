//
//  BaseViewController.m
//  LovePets
//
//  Created by apple on 14/11/18.
//  Copyright (c) 2014年 yuby. All rights reserved.
//

#import "BaseViewController.h"
#import "Config.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"base_navBG.png"] forBarMetrics:UIBarMetricsDefault];
    self.navHeight = 44;
    
    self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftBtn.frame =CGRectMake(0, 0, 51, 22);
    [self.leftBtn setBackgroundImage:[UIImage imageNamed:@"base_navBack.png"] forState:UIControlStateNormal];
    UIBarButtonItem *backitem = [[UIBarButtonItem alloc] initWithCustomView:self.leftBtn];
    [self.leftBtn addTarget:self action:@selector(popVC) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = backitem;
    
    [self.view setBackgroundColor:RGBONLYCOLOR(225)];
    
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightBtn.frame =CGRectMake(0, 0, 44, 44);
    UIBarButtonItem *backitemrightBtn = [[UIBarButtonItem alloc] initWithCustomView:self.rightBtn];
    self.navigationItem.rightBarButtonItem = backitemrightBtn;
    
    self.labTitle=[[UILabel alloc] initWithFrame:CGRectMake(0,0,100,55)];
    self.labTitle.textAlignment=NSTextAlignmentCenter;
    self.labTitle.backgroundColor=[UIColor clearColor];
    self.labTitle.textColor = RGBONLYCOLOR(255);
    self.labTitle.font = [UIFont fontWithName:@"Arial" size:19];
    [self.view addSubview:self.labTitle];
    self.navigationItem.titleView = self.labTitle;
    
    

    
}

- (void)popVC
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
