//
//  Config.h
//  AbilityTest
//
//  Created by apple on 14-10-15.
//  Copyright (c) 2014年 yuby. All rights reserved.
//

#ifndef CloudAtlas_Config_h

#define CloudAtlas_Config_h

#define appBounds [[UIScreen mainScreen] applicationFrame]

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define IOS7 [[UIDevice currentDevice].systemVersion doubleValue]


//设置颜色
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define RGBONLYCOLOR(x) [UIColor colorWithRed:(x)/255.0 green:(x)/255.0 blue:(x)/255.0 alpha:1]
#define RGBAONLYCOLOR(x,a) [UIColor colorWithRed:(x)/255.0 green:(x)/255.0 blue:(x)/255.0 alpha:(a)]

#endif