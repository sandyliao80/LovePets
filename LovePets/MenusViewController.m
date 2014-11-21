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
    
    UILabel * leftNav;
    UILabel * rightNav;
}
@property (nonatomic, strong) NSMutableIndexSet *optionIndices;

@end

@implementation MenusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = RGBONLYCOLOR(255);
    
    UIView * navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
    navView.backgroundColor = [UIColor clearColor];
    
    self.labTitle=[[UILabel alloc] initWithFrame:CGRectMake(0,-7,100,44)];
    self.labTitle.textAlignment=NSTextAlignmentCenter;
    self.labTitle.backgroundColor=[UIColor clearColor];
    self.labTitle.textColor = RGBONLYCOLOR(255);
    self.labTitle.font = [UIFont fontWithName:@"Arial" size:19];
    
    leftNav = [[UILabel alloc]initWithFrame:CGRectMake(30, 33, 20, 4)];
    leftNav.backgroundColor = RGBCOLOR(200, 200, 200);
    [navView addSubview:leftNav];
    
    rightNav = [[UILabel alloc]initWithFrame:CGRectMake(55, 33, 20, 4)];
    rightNav.backgroundColor = [UIColor whiteColor];
    [navView addSubview:rightNav];
    
    [navView addSubview:self.labTitle];
    
    
    self.navigationItem.titleView = navView;
    
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
    
    UITapGestureRecognizer * tapBootome = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cancelAction:)];
    [self.view addGestureRecognizer:tapBootome];
    

    
}

- (void)rightAction:(UIButton *)sender
{
    [UIView animateWithDuration:0.4 animations:^(void){
        
        bottomView.frame = CGRectMake(0, 358-self.navHeight-20, 320, 210);
        
    } completion:^(BOOL fininsh)
    {
        bottomView.frame = CGRectMake(0, 358-self.navHeight-20, 320, 210);
    }];
}

- (IBAction)cancelAction:(id)sender
{
    [UIView animateWithDuration:0.4 animations:^(void){
        
        bottomView.frame = CGRectMake(0, appBounds.size.height, 320, 210);
        
    } completion:^(BOOL fininsh)
     {
         bottomView.frame = CGRectMake(0, appBounds.size.height, 320, 210);
         
     }];
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
        rightNav.backgroundColor = RGBCOLOR(200, 200, 200);
        leftNav.backgroundColor = [UIColor whiteColor];
    }
    else {
        self.labTitle.text = @"首页";
        rightNav.backgroundColor = [UIColor whiteColor];
        leftNav.backgroundColor = RGBCOLOR(200, 200, 200);
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
