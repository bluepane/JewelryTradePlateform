//
//  AppDelegate.m
//  JewelryTradePlateform
//
//  Created by yangjz on 14-8-29.
//  Copyright (c) 2014年 yangjz. All rights reserved.
//

#import "AppDelegate.h"
#import "WelcomeViewController.h"
#import "MainViewController.h"

@implementation AppDelegate
@synthesize welcomeView;
@synthesize mainView;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    self.welcomeView = [[WelcomeViewController alloc]init];
    self.mainView = [[MainViewController alloc]init];
    [self.window insertSubview:self.welcomeView.view atIndex:1];
    [self switchViews];
    [self.window makeKeyAndVisible];
    
    return YES;
}


/*
 * @DO 视图切换动画
 * @param sender(id)
 */
- (void) switchViews
{
    // 准备动画
    // [UIView beginAnimations:@"Curl"context:nil];
    // 动画播放持续时间
    // [UIView setAnimationDuration:1.25];
    // 动画速度
    // [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    // 准备动画
    CATransition *animation = [CATransition animation];
    //动画播放持续时间
    [animation setDuration:2.0f];
    //动画速度,何时快、慢
    [animation setTimingFunction:[CAMediaTimingFunction
                                  functionWithName:kCAMediaTimingFunctionEaseIn]];
    
    if (self.mainView.view.superview == nil)
    {
        //  动画方向
        //  [UIView setAnimationTransition: UIViewAnimationTransitionCurlUp
        //       forView:self.view cache:YES];
        /*动画效果
         (
         kCATransitionFade淡出|
         kCATransitionMoveIn覆盖原图|
         kCATransitionPush推出|
         kCATransitionReveal底部显出来
         )
         */
        [animation setType:kCATransitionReveal];
        /*动画方向
         (
         kCATransitionFromRight|
         kCATransitionFromLeft|
         kCATransitionFromTop|
         kCATransitionFromBottom
         )
         */
        [animation setSubtype:kCATransitionFromBottom];
        [self.window.layer addAnimation:animation forKey:@"Reveal"];
        [self.welcomeView.view removeFromSuperview];
        [self.window insertSubview:self.mainView.view atIndex:0];
        
//        [animation setType:@"suckEffect"];
//        //开始动画
//        [self.window.layer addAnimation:animation forKey:@"suckEffect"];
//        [self.welcomeView.view removeFromSuperview];
//        [self.window insertSubview:self.mainView.view atIndex:0];
//        
    }
    else
    {
        //  动画方向
        //  [UIView setAnimationTransition: UIViewAnimationTransitionCurlDown
        //     forView:self.view  cache:YES];
        /*动画效果
         (
         suckEffect三角|
         rippleEffect水波|
         pageCurl上翻页|
         pageUnCurl下翻页|
         oglFlip上下翻转|
         )
         */
        [animation setType:@"suckEffect"];
        //开始动画
        [self.window.layer addAnimation:animation forKey:@"suckEffect"];
        [self.welcomeView.view removeFromSuperview];
        [self.window insertSubview:self.welcomeView.view atIndex:0];
    }
    // 结束动画
//    [UIView commitAnimations];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
