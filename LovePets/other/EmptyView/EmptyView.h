//
//  EmptyView.h
//  YuePai
//
//  Created by apple on 14-2-20.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DWTagList.h"

@interface EmptyView : UIView

@property(nonatomic,retain)UIImageView *emptyImg;
@property(nonatomic,retain)UILabel *lblEmpty;
@property (nonatomic, retain) DWTagList *tagList;


-(void)setemptyV:(NSMutableArray*)arr;
+(NSInteger)heigtWithObject:(NSMutableArray * )arr;
-(void)setTitle:(NSString*)title;

@end
