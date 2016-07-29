//
//  ImageCenterBtn.h
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


#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface ImageCenterButton : UIButton

// Round Image
@property(nonatomic) IBInspectable BOOL imageIsRound;
// Highlighted Image Alpha
@property(nonatomic) IBInspectable CGFloat highlightedImageAlpha;
// Image Padding
@property(nonatomic) IBInspectable CGFloat padding;
// Border width
@property(nonatomic) IBInspectable CGFloat borderWidth;
// Spacing between imageview and textlabel
@property(nonatomic) IBInspectable CGFloat imageTextSpace;
// Maximum imageview size
@property(nonatomic) IBInspectable CGSize imageViewMaxSize;
// Button backgroundHighlighted
@property(nonatomic, strong) IBInspectable UIColor *backgroundHighlightedColor;
// Button backgroundNormal
@property(nonatomic, strong) IBInspectable UIColor *backgroundNormalColor;
// Border Color
@property(nonatomic, strong) IBInspectable UIColor *borderColor;

@end
