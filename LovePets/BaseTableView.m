//
//  BaseTableView.m
//  PhotoAlbum
//
//  Created by apple on 13-8-19.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "BaseTableView.h"

#define DEFAULT_HEIGHT_OFFSET 52.0f

@implementation BaseTableView
@synthesize footerView;


- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        self.delegate=self;
        self.dataSource=self;
        
        isInit=YES;
        
        
        self.storeHouseRefreshControl = [CBStoreHouseRefreshControl attachToScrollView:self target:self refreshAction:@selector(refreshTriggered:) plist:@"yuepai" color:RGBCOLOR(0, 176, 232) lineWidth:1.5 dropHeight:66 scale:1 horizontalRandomness:150 reverseLoadingAnimation:YES internalAnimationFactor:0.5];
        TableFooterV *afooterView = (TableFooterV *)[[[NSBundle mainBundle] loadNibNamed:@"TableFooterV" owner:self options:nil] objectAtIndex:0];
        afooterView.backgroundColor = [UIColor clearColor];
        self.footerView = afooterView;
        self.isRefreshing = YES;
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.delegate=self;
        self.dataSource=self;
        
        self.storeHouseRefreshControl = [CBStoreHouseRefreshControl attachToScrollView:self target:self refreshAction:@selector(refreshTriggered:) plist:@"yuepai" color:RGBCOLOR(0, 120, 180) lineWidth:1.5 dropHeight:80 scale:1 horizontalRandomness:150 reverseLoadingAnimation:YES internalAnimationFactor:0.5];
        TableFooterV *afooterView = (TableFooterV *)[[[NSBundle mainBundle] loadNibNamed:@"TableFooterV" owner:self options:nil] objectAtIndex:0];
        afooterView.backgroundColor = [UIColor clearColor];
        self.footerView = afooterView;
        self.isRefreshing = YES;
        isInit=YES;

        
        // Initialization code
    }
    return self;
}

-(void)loadMoreData{

}

-(void)refreshData{

}

#pragma mark -UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

#pragma mark - Pull to Refresh

- (void) pinHeaderView
{
    
}

- (void) unpinHeaderView
{
}

- (void) headerViewDidScroll:(BOOL)willRefreshOnRelease scrollView:(UIScrollView *)scrollView{
}

- (void) refresh:(BOOL)isRefresh{
    if (!isRefresh)
        return ;
    
}

#pragma mark - Load More

- (void) setFooterView:(UIView *)aView
{
    if (!self)
        return;
    
    self.tableFooterView = nil;
    footerView = nil;
    
    if (aView) {
        footerView.backgroundColor = [UIColor clearColor];
        self.tableFooterView = footerView;
    }
}

- (void) willBeginLoadingMore
{
    TableFooterV *fv = (TableFooterV *)self.footerView;
    [fv.aIndicatorView startAnimating];
    fv.aIndicatorView.hidden=NO;

    fv.footLabel.text = @"正在加载...";

}

- (void) loadMoreCompleting
{
    self.isLoadingMore = NO;
    [self loadMoreCompleted];
}

- (void) loadMoreCompleted
{
    
    TableFooterV *fv = (TableFooterV *)self.footerView;
    [fv.aIndicatorView stopAnimating];
    
    fv.aIndicatorView.hidden=YES;
    if (self.canLoadMore) {
        if (self.isEmpty) {
            fv.footLabel.text = @"";
        }else{
            fv.footLabel.text = @"上拉加载更多";
        }
    }
    else{
        if (self.isEmpty) {
            fv.footLabel.text = @"";
        }else{
            fv.footLabel.text = @"已经到底了哈！";
        }
    }
}


#pragma mark - Notifying refresh control of scrolling

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self tableViewDidScroll:scrollView];
    [self.storeHouseRefreshControl scrollViewDidScroll];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self performSelector:@selector(finishRefreshControl) withObject:nil afterDelay:2 inModes:@[NSRunLoopCommonModes]];
    //测试用
    [self tableViewDidEndDragging:scrollView willDecelerate:decelerate];
    [self.storeHouseRefreshControl scrollViewDidEndDragging];
}

#pragma mark - Listening for the user to trigger a refresh

- (void)refreshTriggered:(id)sender
{
    [self performSelector:@selector(loadMoreData) withObject:nil];

}

- (void)finishRefreshControl
{
    [self.storeHouseRefreshControl finishingLoading];
}

- (void) loadMore
{
    if (self.isLoadingMore)
        [self loadMore:NO];
    
    [self willBeginLoadingMore];
    self.isLoadingMore = YES;
    [self loadMore:YES];
}

- (void) loadMore:(BOOL)isLoadMore
{
    if (!isLoadMore||!isInit){
        return ;
    }
    
    // Do your async loading here
    [self performSelector:@selector(loadMoreData) withObject:nil];
    // See -addItemsOnBottom for more info on what to do after loading more items
    
}

- (void) tableViewDidScroll:(UIScrollView *)scrollView
{
    self.isRefreshing = self.storeHouseRefreshControl.isRefreshing;
    if (!self.isLoadingMore && self.canLoadMore) {
        CGFloat scrollPosition = scrollView.contentSize.height - scrollView.frame.size.height - scrollView.contentOffset.y;
        if (scrollPosition < [self footerLoadMoreHeight]) {
            [self loadMore];
        }
    }
}

- (CGFloat) footerLoadMoreHeight
{
    if (footerView)
        return footerView.frame.size.height;
    else
        return DEFAULT_HEIGHT_OFFSET;
}


- (void)tableViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{

}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
