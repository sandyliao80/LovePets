//
//  BaseTableView.h
//  PhotoAlbum
//
//  Created by apple on 13-8-19.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "TableFooterV.h"
#import "CBStoreHouseRefreshControl.h"

@interface BaseTableView : UITableView<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>{
    BOOL isInit;
}

@property (nonatomic, strong) CBStoreHouseRefreshControl *storeHouseRefreshControl;
@property(nonatomic,assign)BOOL isEmpty;

@property (nonatomic, retain) UIView *footerView;


// The view used for "load more"

@property (nonatomic,assign) BOOL isRefreshing;
@property (nonatomic,assign) BOOL isLoadingMore;

// Defaults to YES
@property (nonatomic) BOOL canLoadMore;
@property (nonatomic) BOOL canPullToRefresh;

- (void)loadMoreCompleting;

@end
