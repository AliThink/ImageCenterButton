//
//  ViewController.m
//  ImageCenterButtonDemo
//
//  Created by AliThink on 15/9/16.
//  Copyright (c) 2015年 AliThink. All rights reserved.
//

#import "ViewController.h"
#import "ImageCenterButton.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Manual setup
    //[self configView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configView {
    [self.containerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSUInteger rows = 3.0;
    NSUInteger cols = 3.0;
    CGFloat unitWidth = self.containerView.bounds.size.width / cols;
    CGFloat unitHeight = self.containerView.bounds.size.height / rows;
    
    for (int row = 0; row < rows; row++) {
        for (int col = 0; col < cols; col ++) {
            ImageCenterButton *imageCenterButton = [[ImageCenterButton alloc] init];
            imageCenterButton.frame = CGRectMake(col * unitWidth, row * unitHeight, unitWidth, unitHeight);
            [imageCenterButton setImage:[UIImage imageNamed:@"avatar"] forState:UIControlStateNormal];
            [imageCenterButton setTitle:@"AliThink" forState:UIControlStateNormal];
            [imageCenterButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
            imageCenterButton.titleLabel.font = [UIFont systemFontOfSize: 16];
            imageCenterButton.backgroundColor = [UIColor whiteColor];
            imageCenterButton.imageIsRound = YES;
            imageCenterButton.padding = 14;
            imageCenterButton.layer.borderColor = [[UIColor lightGrayColor] CGColor];
            imageCenterButton.layer.borderWidth = 0.5;
            [self.containerView addSubview:imageCenterButton];
        }
    }
    
}


@end
