//
//  MenusTableV.h
//  LovePets
//
//  Created by apple on 14/11/18.
//  Copyright (c) 2014年 yuby. All rights reserved.
//

#import "BaseTableView.h"

@protocol  MenusViewDelegate <NSObject>

-(void)didtableView:(id)tableView row:(NSInteger)row arrOne:(NSMutableArray *)arrOne;

@end

@interface MenusTableV : BaseTableView{
    int page;
    __unsafe_unretained id<MenusViewDelegate> _meunsDelegate;
    
    NSInteger tempRefre; //第一次进入 现实菊花
}

@property(nonatomic,assign)int limit;
@property(nonatomic,assign)id<MenusViewDelegate> meunsDelegate;
@property(nonatomic,retain)NSMutableArray *arrlist;
@property(nonatomic,retain)NSMutableDictionary *arrDic;
@property (nonatomic,retain) NSString * orderTime;

-(void)refreshDataSyn;
-(void)refreshData;

@end
