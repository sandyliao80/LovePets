//
//  MenusTableV.m
//  LovePets
//
//  Created by apple on 14/11/18.
//  Copyright (c) 2014年 yuby. All rights reserved.
//

#import "MenusTableV.h"
#import "EmptyView.h"
#import "MenusCell.h"

@implementation MenusTableV

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        page = 1;
        _limit = 10;
        tempRefre = 1;
        [self setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        self.delegate=self;
        self.dataSource=self;
        self.showsVerticalScrollIndicator = NO;
        
        // Initialization code
    }
    return self;
}

#pragma mark - BaseTableView DataSource
- (void)loadData{
//    if (tempRefre ==1) {
//        [SVProgressHUD showWithStatus:@"加载中..."];
//    }
//    tempRefre++;
//    
//    NSMutableArray *tempArr=nil;
//    @try {
//        
//        page++;
//        
//        if (self.isRefreshing) {
//            page = 1;
//            self.canLoadMore=YES;
//        }
//        
//        //get all review
//        paging = [OrderService listOrdersWithOrderType:OrderReceivedType tradeState:nil page:page limit:_limit orderTime:self.orderTime];
//        
//        tempArr=paging.Array;
//        
//        if (self.storeHouseRefreshControl&&page==1 ) {
//            if (_arrlist!=nil) {
//                [_arrlist removeAllObjects];
//            }
//            _arrlist=nil;
//            _arrlist=[[NSMutableArray alloc] init];
//            
//            if (_arrDic!=nil) {
//                [_arrDic removeAllObjects];
//            }
//            _arrDic=nil;
//            _arrDic=[[NSMutableDictionary alloc] init];
//            
//        }
//        
//        
//        if (tempArr!=nil&&tempArr.count!=0) {
//            for (int i=0; i<tempArr.count; i++) {
//                if ([_arrDic valueForKey:((OrderInfo*)[tempArr objectAtIndex:i]).OrderID]==nil) {
//                    [_arrDic setValue:((OrderInfo*)[tempArr objectAtIndex:i]).OrderID forKey:((OrderInfo*)[tempArr objectAtIndex:i]).OrderID];
//                    [_arrlist addObject:[tempArr objectAtIndex:i]];
//                }
//            }
//        }
//        else{
//            page>1? page--:page;
//        }
//        [SVProgressHUD dismiss];
//        [self.storeHouseRefreshControl performSelectorOnMainThread:@selector(finishingLoading) withObject:nil waitUntilDone:NO];
//    }
//    @catch (NSException *exception) {
//        
//        [SVProgressHUD show];
//        [SVProgressHUD dismissWithError:[NSString stringWithFormat:@"%@",exception] afterDelay:2];
//        [self.storeHouseRefreshControl performSelectorOnMainThread:@selector(finishingLoading) withObject:nil waitUntilDone:NO];
//    }
//    @finally {
//        self.isEmpty = (_arrlist==nil || _arrlist.count==0);
//        
//        [self performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
//        
//        if (paging.NextPage == -1) {
//            self.canLoadMore=NO;
//        }
//        
//        [self performSelectorOnMainThread:@selector(loadMoreCompleting) withObject:nil waitUntilDone:NO];
//    }
}

-(void)loadMoreData{
    [self performSelectorInBackground:@selector(loadData) withObject:nil];
    
}

-(void)refreshDataSyn{
    [self loadData];
}

-(void)refreshData{
    [self performSelectorInBackground:@selector(loadData) withObject:nil];
}

#pragma mark - UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.meunsDelegate!=nil&&[self.meunsDelegate respondsToSelector:@selector(didtableView:row:arrOne:)]) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        [self.meunsDelegate didtableView:self row:indexPath.row arrOne:nil];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
}

#pragma mark - UITableView DataSource
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return self.isEmpty ? (self.frame.size.height-self.storeHouseRefreshControl.frame.size.height) : 0;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 5)];
    [view setBackgroundColor:[UIColor clearColor]];
    view.clipsToBounds=YES;
    if (self.isEmpty) {
        [view setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-self.storeHouseRefreshControl.frame.size.height)];
        EmptyView *emptyV=[[EmptyView alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, 106)];
        emptyV.center=view.center;
        [emptyV setTitle:@"还没有人预约你的服务!""您还没有预约摄影师服务!"];
        emptyV.lblEmpty.frame=CGRectMake(35, emptyV.lblEmpty.frame.origin.y, emptyV.lblEmpty.frame.size.width-35*2, emptyV.lblEmpty.frame.size.height+20);
        emptyV.lblEmpty.numberOfLines=0;
        emptyV.lblEmpty.lineBreakMode=NSLineBreakByCharWrapping;
        [view addSubview:emptyV];
        
    }
    return view;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 12;
    //[self.arrlist count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"MenusCell";
    MenusCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        UINib * cellNib =[UINib nibWithNibName:@"MenusCell" bundle:nil];
        [tableView registerNib:cellNib forCellReuseIdentifier:CellIdentifier];
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        [self setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    }
//    [cell updataCellWithOrderInfo:_arrlist[indexPath.row]];
    
    return cell;
}

@end
