//
//  ImageCenterBtn.h
//  ButtonTopImage
//
//  Created by AliThink on 15/9/16.
//  Copyright (c) 2015年 AliThink. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageCenterButton : UIButton

@property BOOL imageIsRound;
@property CGFloat padding;
@property CGFloat imageTextSpace;
@property CGSize imageViewMaxSize;
@property(nonatomic, strong) UIColor *backgroundHighlightedColor;
@property(nonatomic, strong) UIColor *backgroundNormalColor;

@end
