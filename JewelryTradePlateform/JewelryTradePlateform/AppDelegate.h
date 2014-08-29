//
//  AppDelegate.h
//  JewelryTradePlateform
//
//  Created by yangjz on 14-8-29.
//  Copyright (c) 2014年 yangjz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WelcomeViewController;
@class MainViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,retain)WelcomeViewController* welcomeView;
@property (nonatomic,retain)MainViewController* mainView;


@end
