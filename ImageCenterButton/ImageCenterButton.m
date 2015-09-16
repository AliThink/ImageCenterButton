//
//  ImageCenterBtn.m
//  ButtonTopImage
//
//  Created by AliThink on 15/9/16.
//  Copyright (c) 2015年 AliThink. All rights reserved.
//

#import "ImageCenterButton.h"

#define IMAGECENTERBUTTON_IMAGE_TEXT_SPACING 10.0
#define IMAGECENTERBUTTON_TITLE_MIN_HEIGHT   14.0
#define IMAGECENTERBUTTON_PADDING_MIN        8.0

@implementation ImageCenterButton

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self addAction];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addAction];
    }
    return self;
}

- (void)addAction {
    [self addTarget:self action:@selector(pressed:) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpOutside];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.adjustsImageWhenHighlighted = NO;
    
    if (!self.padding) {
        self.padding = IMAGECENTERBUTTON_PADDING_MIN;
    }
    
    if (!self.imageTextSpace) {
        self.imageTextSpace = IMAGECENTERBUTTON_IMAGE_TEXT_SPACING;
    }
    
    CGFloat titleLabelHeight = self.titleLabel.frame.size.height;
    if (titleLabelHeight == 0) {
        titleLabelHeight = IMAGECENTERBUTTON_TITLE_MIN_HEIGHT;
    }
    
    CGFloat imageMaxHeight = self.frame.size.height - titleLabelHeight - self.imageTextSpace - self.padding * 2;
    CGFloat imageMaxWidth = self.frame.size.width - self.padding * 2;
    
    if (self.imageViewMaxSize.height) {
        imageMaxHeight = self.imageViewMaxSize.height;
    }
    if (self.imageViewMaxSize.width) {
        imageMaxWidth = self.imageViewMaxSize.width;
    }
    
    //Set ImageView Threshold
    if (self.imageView.frame.size.height > imageMaxHeight) {
        CGRect newImageView = self.imageView.frame;
        newImageView.size = CGSizeMake(imageMaxHeight / self.imageView.frame.size.height * self.imageView.frame.size.width, imageMaxHeight);
        self.imageView.frame = newImageView;
    }
    
    if (self.imageView.frame.size.width > imageMaxWidth) {
        CGRect newImageView = self.imageView.frame;
        newImageView.size = CGSizeMake(imageMaxWidth , imageMaxWidth / self.imageView.frame.size.width * self.imageView.frame.size.height);
        self.imageView.frame = newImageView;
    }
    
    CGFloat totalHeight = self.imageView.frame.size.height + self.imageTextSpace + titleLabelHeight;
    
    //Center image
    CGPoint center = self.imageView.center;
    center.x = self.frame.size.width / 2.0;
    center.y = self.frame.size.height / 2.0 - totalHeight / 2.0 + self.imageView.frame.size.height / 2.0;
    self.imageView.center = center;
    
    if (self.imageIsRound) {
        self.imageView.layer.cornerRadius = self.imageView.frame.size.width / 2.0;
    }
    
    CGRect titleLabelFrame = self.titleLabel.frame;
    titleLabelFrame.size = CGSizeMake(self.frame.size.width, titleLabelHeight);
    self.titleLabel.frame = titleLabelFrame;
    
    //Center text
    CGPoint titleCenter = self.titleLabel.center;
    titleCenter.x = self.frame.size.width / 2.0;
    titleCenter.y = self.imageView.center.y + self.imageView.frame.size.height / 2.0 + self.imageTextSpace + titleLabelHeight / 2.0;
    self.titleLabel.center = titleCenter;
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)pressed:(UIButton *)btn {
    if (self.backgroundHighlightedColor) {
        [btn setBackgroundColor:self.backgroundHighlightedColor];
    } else {
        [btn setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1]];
    }
}

- (void)touchUp:(UIButton *)btn {
    if (self.backgroundNormalColor) {
        [btn setBackgroundColor:self.backgroundNormalColor];
    } else {
        [btn setBackgroundColor:[UIColor whiteColor]];
    }
}


@end
