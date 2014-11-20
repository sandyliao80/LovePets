//
//  MenusCell.h
//  LovePets
//
//  Created by apple on 14/11/18.
//  Copyright (c) 2014年 yuby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenusCell : UITableViewCell

{
    IBOutlet UIView * bgView;
    IBOutlet UIImageView * headImage;
    
    IBOutlet UIImageView * imgInfo;
    
}

- (void)updataCellWithOrderInfo:(NSInteger)index;

@end
