//
//  InfoTableView.h
//  LovePets
//
//  Created by 于博洋 on 14/11/19.
//  Copyright (c) 2014年 yuby. All rights reserved.
//

#import "BaseTableView.h"
#import "InfoViewController.h"

@interface InfoTableView : BaseTableView
{
    int page;
    //    __unsafe_unretained id<OrdersViewDelegate> _oDelegate;
    
    NSInteger tempRefre; //第一次进入 现实菊花
}
@property (nonatomic,retain)InfoViewController * infoVC;

@property(nonatomic,assign)int limit;
//@property(nonatomic,assign)id<OrdersViewDelegate> oDelegate;
@property(nonatomic,retain)NSMutableArray *arrlist;
@property(nonatomic,retain)NSMutableDictionary *arrDic;
@property (nonatomic,retain) NSString * orderTime;

-(void)refreshDataSyn;
-(void)refreshData;
@end
