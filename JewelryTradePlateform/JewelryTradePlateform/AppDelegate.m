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
#import "NotificationHeader.h"

@implementation AppDelegate
@synthesize welcomeView;
@synthesize mainView;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.welcomeView = [[WelcomeViewController alloc]init];
    [self.window addSubview:self.welcomeView.view];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(switchViews) name:BNRWelcomeChangedNotification object:nil];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void) switchViews
{

    self.mainView = [[MainViewController alloc]init];
    [self.window addSubview:self.mainView.view];
    [self.window bringSubviewToFront:self.welcomeView.view];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
//    [UIView setAnimationDidStopSelector:@selector(welcomeViewAnimationDone)];
    [UIView setAnimationDuration:3];
    
    self.welcomeView.view.alpha = 0;
    [self.welcomeView.indicatorView stopAnimating];
    
    [UIView commitAnimations];
 
}

- (void)welcomeViewAnimationDone
{
//    self.welcomeView = nil;
//    [self.welcomeView.indicatorView stopAnimating];
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
