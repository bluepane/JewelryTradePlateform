//
//  WelcomeViewController.h
//  JewelryTradePlateform
//
//  Created by yangjz on 14-8-29.
//  Copyright (c) 2014年 yangjz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WelcomeViewController : UIViewController
@property(nonatomic,retain)UIImageView *welcomeImgView;
@property(nonatomic,retain)UIScrollView *showScrollView;
@property(nonatomic,retain)UIActivityIndicatorView *indicatorView;

- (void)welcomeViewMake;


@end
