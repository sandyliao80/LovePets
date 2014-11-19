//
//  AppDelegate.h
//  LovePets
//
//  Created by apple on 14/11/18.
//  Copyright (c) 2014年 yuby. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MenusViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,retain) MenusViewController * menusVC;

@end

