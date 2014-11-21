//
//  MenusViewController.m
//  LovePets
//
//  Created by apple on 14/11/18.
//  Copyright (c) 2014年 yuby. All rights reserved.
//

#import "MenusViewController.h"
#import "MenusTableV.h"
#import "RNFrostedSidebar.h"
#import "ChatListTableView.h"
#import "InfoViewController.h"

@interface MenusViewController ()<RNFrostedSidebarDelegate,UIScrollViewDelegate,MenusViewDelegate>
{
    RNFrostedSidebar *callout;
}
@property (nonatomic, strong) NSMutableIndexSet *optionIndices;

@end

@implementation MenusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //UIColor(red: 0/255.0, green: 176/255.0, blue: 232/255.0, alpha: 1.0)
    self.view.backgroundColor = RGBONLYCOLOR(255);
    
    self.labTitle.text = @"首页";
    self.leftBtn.frame =CGRectMake(0, 0, 19, 17);
    [self.leftBtn setBackgroundImage:[UIImage imageNamed:@"burger.png"] forState:UIControlStateNormal];
    [self.leftBtn addTarget:self action:@selector(menusAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.rightBtn.frame =CGRectMake(0, 0, 24, 17);
    [self.rightBtn setBackgroundImage:[UIImage imageNamed:@"menus_navRight.png"] forState:UIControlStateNormal];
    [self.rightBtn addTarget:self action:@selector(rightAction:) forControlEvents:UIControlEventTouchUpInside];
    //@2x 14 10
    
    self.optionIndices = [NSMutableIndexSet indexSetWithIndex:1];
    
    MenusTableV * menusTavleView = [[MenusTableV alloc]initWithFrame:CGRectMake(0, 0, appBounds.size.width, appBounds.size.height-self.navHeight) style:UITableViewStylePlain];
    menusTavleView.meunsDelegate = self;
    menusTavleView.menusVC = self;
    menusTavleView.backgroundColor = RGBONLYCOLOR(225);
    
    ChatListTableView * chatTableView = [[ChatListTableView alloc]initWithFrame:CGRectMake(appBounds.size.width, 0, appBounds.size.width, appBounds.size.height-self.navHeight)];
    chatTableView.backgroundColor = RGBONLYCOLOR(225);
    
    self.aScrollVIew.frame = CGRectMake(0, 0, appBounds.size.width, appBounds.size.height);
    self.aScrollVIew.contentSize=CGSizeMake(appBounds.size.width*2, appBounds.size.height);
    self.aScrollVIew.pagingEnabled = YES;
    self.aScrollVIew.delegate = self;
    self.aScrollVIew.backgroundColor = RGBONLYCOLOR(225);
    
    [self.aScrollVIew addSubview:menusTavleView];
    [self.aScrollVIew addSubview:chatTableView];
    

    
}

- (void)rightAction:(UIButton *)sender
{
    
}

- (void)menusAction:(UIButton * )sender
{
    NSArray *images = @[
                        [UIImage imageNamed:@"meuns_profile"],
                        [UIImage imageNamed:@"meuns_nil.png"],
                        [UIImage imageNamed:@"menus_oneTitle.png"],
                        [UIImage imageNamed:@"menus_twoTitle.png"],
                        [UIImage imageNamed:@"meuns_nil.png"],
                        [UIImage imageNamed:@"menus_yijian.png"],
                        [UIImage imageNamed:@"menus_clearTitle.png"],
                        [UIImage imageNamed:@"menus_aboutMe.png"],
                        [UIImage imageNamed:@"meuns_nil.png"],
                        [UIImage imageNamed:@"menus_logonout.png"],
                        ];
    callout = [[RNFrostedSidebar alloc] initWithImages:images];
    callout.delegate = self;
    [callout show];
}

#pragma mark - RNFrostedSidebarDelegate

- (void)sidebar:(RNFrostedSidebar *)sidebar didTapItemAtIndex:(NSUInteger)index {

    if (index == 3) {
        [self.aScrollVIew setContentOffset:CGPointMake(320*1, 0) animated:YES];
    }
    else if (index == 2)
    {
        [self.aScrollVIew setContentOffset:CGPointMake(320*0, 0) animated:YES];
    }
    [sidebar dismiss];
}

- (void)sidebar:(RNFrostedSidebar *)sidebar didEnable:(BOOL)itemEnabled itemAtIndex:(NSUInteger)index {
    if (itemEnabled) {
        [self.optionIndices addIndex:index];
    }
    else {
        [self.optionIndices removeIndex:index];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat xOffset = scrollView.contentOffset.x;
    if (xOffset >= appBounds.size.width/2) {
        self.labTitle.text = @"聊天记录";
    }
    else {
        self.labTitle.text = @"首页";
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark menusTavleDeledate

- (void)didtableView:(id)tableView row:(NSInteger)row arrOne:(NSMutableArray *)arrOne
{
    InfoViewController * next = [[InfoViewController alloc]init];
    [self.navigationController pushViewController:next animated:YES];
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
