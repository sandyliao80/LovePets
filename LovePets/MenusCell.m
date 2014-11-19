//
//  MenusCell.m
//  LovePets
//
//  Created by apple on 14/11/18.
//  Copyright (c) 2014年 yuby. All rights reserved.
//

#import "MenusCell.h"

@implementation MenusCell

- (void)awakeFromNib {
    // Initialization code
//    if (self.backgroundImageView != nil) {
//        self.senderPhotoImageView.layer.cornerRadius = 8.0;
//        
//        CAShapeLayer *photoOutlineLayer = [CAShapeLayer layer];
//        photoOutlineLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.senderPhotoImageView.bounds cornerRadius:8.0].CGPath;
//        photoOutlineLayer.strokeColor = [UIColor whiteColor].CGColor;
//        photoOutlineLayer.fillColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.1].CGColor;
//        photoOutlineLayer.lineWidth = 2.0;
//        photoOutlineLayer.frame = self.senderPhotoImageView.bounds;
//        [self.senderPhotoImageView.layer addSublayer:photoOutlineLayer];
//        
//        CAShapeLayer *backgroundOutlineLayer = [CAShapeLayer layer];
//        CGRect rect = UIEdgeInsetsInsetRect(self.backgroundImageView.bounds, UIEdgeInsetsMake(8.0, 4.0, 2.0, 4.0));
//        backgroundOutlineLayer.path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:12.0].CGPath;
//        backgroundOutlineLayer.strokeColor = [UIColor colorWithWhite:1.0 alpha:0.4].CGColor;
//        backgroundOutlineLayer.fillColor = [UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.1].CGColor;
//        backgroundOutlineLayer.lineWidth = 2.0;
//        backgroundOutlineLayer.frame = self.backgroundImageView.bounds;
//        [self.backgroundImageView.layer addSublayer:backgroundOutlineLayer];
//    }
    userHeadView.layer.cornerRadius = 14;
    userHeadView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
