//
//  ChatListTableView.h
//  LovePets
//
//  Created by apple on 14/11/19.
//  Copyright (c) 2014年 yuby. All rights reserved.
//

#import "BaseTableView.h"

@interface ChatListTableView : BaseTableView
{
    int page;
    //    __unsafe_unretained id<OrdersViewDelegate> _oDelegate;
    
    NSInteger tempRefre; //第一次进入 现实菊花
}

@property(nonatomic,assign)int limit;
//@property(nonatomic,assign)id<OrdersViewDelegate> oDelegate;
@property(nonatomic,retain)NSMutableArray *arrlist;
@property(nonatomic,retain)NSMutableDictionary *arrDic;
@property (nonatomic,retain) NSString * orderTime;

-(void)refreshDataSyn;
-(void)refreshData;
@end
