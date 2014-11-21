//
//  InfoViewController.m
//  LovePets
//
//  Created by apple on 14/11/19.
//  Copyright (c) 2014年 yuby. All rights reserved.
//

#import "InfoViewController.h"
#import "InfoTableView.h"
#import "PersonViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.labTitle.text = @"CoCo 的  猫";
    InfoTableView * infoTableView = [[InfoTableView alloc]initWithFrame:CGRectMake(0, 0, appBounds.size.width, appBounds.size.height-self.navHeight) style:UITableViewStylePlain];
//    infoTableView.meunsDelegate = self;
    infoTableView.backgroundColor = RGBONLYCOLOR(225);
    infoTableView.tableHeaderView = headView;
    infoTableView.infoVC = self;
    [self.view addSubview:infoTableView];
    
    
    headImg.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(jumpToPerson:)];
    [headImg addGestureRecognizer:tap];
}

- (void)jumpToPerson:(UITapGestureRecognizer *)tap
{
    PersonViewController * next = [[PersonViewController alloc]init];
    [self.navigationController pushViewController:next animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*

 */

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
