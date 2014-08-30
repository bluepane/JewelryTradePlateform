//
//  WelcomeViewController.m
//  JewelryTradePlateform
//
//  Created by yangjz on 14-8-29.
//  Copyright (c) 2014年 yangjz. All rights reserved.
//

#import "WelcomeViewController.h"
#import "NotificationHeader.h"

#define kWelcomeImg @"1welcome.jpg"
#define kScreenBounds [UIScreen mainScreen].bounds

@interface WelcomeViewController ()

@end

@implementation WelcomeViewController
@synthesize welcomeImgView;
@synthesize indicatorView;
@synthesize showScrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        [self.view setBackgroundColor:[UIColor orangeColor]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self welcomeViewMake];

}

- (void)welcomeViewMake
{
    
    //设置图片，如果是引导页可触发跳转主页面事件
    self.welcomeImgView = [[UIImageView alloc]initWithFrame:kScreenBounds];
    [self.welcomeImgView setImage:[UIImage imageNamed:kWelcomeImg]];
    [self.welcomeImgView setBackgroundColor:[UIColor clearColor]];
    //设置可与用户交互
//    [self.welcomeImgView setUserInteractionEnabled:YES];
    //添加事件
//    [self.welcomeImgView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)]];
    
    CGRect bounds = kScreenBounds;
    self.showScrollView = [[UIScrollView alloc]initWithFrame:kScreenBounds];
    [self.showScrollView setContentSize:CGSizeMake(bounds.size.width, bounds.size.height)];
    [self.showScrollView setPagingEnabled:YES];
    [self.showScrollView setBounces:YES];
    [self.showScrollView setScrollEnabled:YES];
    [self.showScrollView setShowsHorizontalScrollIndicator:NO];
    [self.showScrollView setShowsVerticalScrollIndicator:NO];
    
    [self.showScrollView addSubview:self.welcomeImgView];
    [self.view addSubview:self.showScrollView];
    
    self.indicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [self.indicatorView setCenter:CGPointMake(bounds.size.width/2, bounds.size.height*5/7)];
    [self.indicatorView startAnimating];
    [self.view addSubview:self.indicatorView];
    
    [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(nextAction) userInfo:nil repeats:NO];
    
}

- (void)nextAction
{
    [[NSNotificationCenter defaultCenter]postNotificationName:BNRWelcomeChangedNotification object:nil userInfo:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
