//
//  PersonViewController.m
//  LovePets
//
//  Created by 于博洋 on 14/11/19.
//  Copyright (c) 2014年 yuby. All rights reserved.
//

#import "PersonViewController.h"
#import "PersonTableView.h"

@interface PersonViewController ()

@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.labTitle.text = @"CoCo";
    
    PersonTableView * personTavleView = [[PersonTableView alloc]initWithFrame:CGRectMake(0, 0, appBounds.size.width, appBounds.size.height-self.navHeight) style:UITableViewStylePlain];
    personTavleView.backgroundColor = RGBONLYCOLOR(225);
    personTavleView.tableHeaderView = headView;
    [self.view addSubview:personTavleView];
    
    userHeadView.layer.masksToBounds = YES;
    userHeadView.layer.cornerRadius = RADIUSNUM;
    
    
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
