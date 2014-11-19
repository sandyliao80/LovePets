//
//  EmptyView.m
//  YuePai
//
//  Created by apple on 14-2-20.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "EmptyView.h"

@implementation EmptyView

//-(void)dealloc{
//    [_emptyImg release];
//    [_lblEmpty release];
//    [super dealloc];
//}

-(id)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        _emptyImg=[[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width-60)/2, 0, 60, 60)];
        [self addSubview:_emptyImg];
        
        _lblEmpty=[[UILabel alloc] initWithFrame:CGRectMake(0, _emptyImg.frame.origin.y+_emptyImg.frame.size.height+15, frame.size.width, 14)];
        _lblEmpty.textColor=RGBONLYCOLOR(153);
        _lblEmpty.textAlignment=NSTextAlignmentCenter;
        _lblEmpty.font=[UIFont systemFontOfSize:14];
        _lblEmpty.backgroundColor=[UIColor clearColor];
        
        
        _tagList = [[DWTagList alloc] init];
        [self addSubview:_lblEmpty];
        
    }
    return self;
}

-(void)setemptyV:(NSMutableArray*)arr
{
    //热门关键字
    _tagList.frame = CGRectMake(10, 20, self.bounds.size.width-20, 50.0f);
    [_tagList setTags:arr];
    [self addSubview:_tagList];
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, _tagList.frame.origin.y + _tagList.frame.size.height+20);
}
+(NSInteger)heigtWithObject:(NSMutableArray * )arr
{
    DWTagList * aaa = [[DWTagList alloc] initWithFrame:CGRectMake(10, 20, 300, 50.0f)];
    [aaa setTags:arr];
    aaa.backgroundColor = [UIColor blueColor];
    if ([arr isKindOfClass:[NSMutableArray class]] && [arr count] > 0) {
        return aaa.frame.origin.y + aaa.frame.size.height;
    }
    else
    {
        return 0;
    }
    
}
-(void)setTitle:(NSString*)title{
    _lblEmpty.text=title;

    _lblEmpty.frame=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
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
