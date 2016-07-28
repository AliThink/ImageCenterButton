//
//  ImageCenterBtn.m
//  ButtonTopImage
//
//  Created by AliThink on 15/9/16.
//  Copyright (c) 2015年 AliThink. All rights reserved.
//

// This code is distributed under the terms and conditions of the MIT license.

// Copyright (c) 2015 AliThink
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


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

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addAction];
    }
    return self;
}

- (void)addAction {
    [self addTarget:self action:@selector(pressed:) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpOutside];
    [self addTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchCancel];
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
  
    [self.titleLabel sizeToFit];
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
    
    if (self.borderWidth) {
        self.layer.borderWidth = self.borderWidth;
    }
    
    if (self.borderColor) {
        self.layer.borderColor = self.borderColor.CGColor;
    }
}

- (void)pressed:(UIButton *)btn {
    if (self.highlightedImageAlpha) {
      [self.imageView setAlpha:self.highlightedImageAlpha];
    }
  
    if (self.backgroundHighlightedColor) {
        [btn setBackgroundColor:self.backgroundHighlightedColor];
    } else {
        [btn setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1]];
    }
}

- (void)touchUp:(UIButton *)btn {
    [self.imageView setAlpha:1.0];

    if (self.backgroundNormalColor) {
        [btn setBackgroundColor:self.backgroundNormalColor];
    } else {
        [btn setBackgroundColor:[UIColor whiteColor]];
    }
}


@end
