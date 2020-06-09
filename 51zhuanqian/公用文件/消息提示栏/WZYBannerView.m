//
//  WZYBannerView.m
//  iOS-Foreground-Push-Notification
//
//  Created by WangZhenyu on 16/7/27.
//  Copyright © 2016年 WangZhenyu. All rights reserved.
//

#import "WZYBannerView.h"
#import "WZYForeNotification.h"
#import "UIViewController+WZYForeNotification.h"
#import "UIImage+ColorAtPoint.h"

@interface WZYBannerView()

@property (weak, nonatomic) IBOutlet UIImageView *icon_image;
@property (weak, nonatomic) IBOutlet UILabel *title_label;
@property (weak, nonatomic) IBOutlet UILabel *content_label;
@property (weak, nonatomic) IBOutlet UILabel *time_label;
@property (weak, nonatomic) IBOutlet UIView *line_view;
@end

@implementation WZYBannerView

#define BannerHeight 70
#define BannerWidth [UIScreen mainScreen].bounds.size.width

-(void)awakeFromNib{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(statusBarOrientationChange:) name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
    self.userInfo = [NSDictionary dictionary];
    [self apperWithAnimation];
    [self addGestureRecognizer];
    [super awakeFromNib];
}


-(void)setUserInfo:(NSDictionary *)userInfo{
    _userInfo = userInfo;
    UIImage *appIcon;
    appIcon = [UIImage imageNamed:@"AppIcon60x60"];
    if (!appIcon) {
        appIcon = [UIImage imageNamed:@"AppIcon40x40"];
    }
    [self.icon_image setImage:appIcon];
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    // app名称
    NSString *appName = [infoDictionary objectForKey:@"CFBundleName"];
    if (!appName) {
        appName = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    }
    //appName = @"input a app name here"; //if appName = nil, unsign this line and change it to you'r own app name.
    if (!appName) {
        assert(0);
    }
    self.title_label.text   = appName;
    self.content_label.text = self.userInfo[@"aps"][@"alert"];
    self.time_label.text = WZYBannerViewTimeText;
    
}

-(void)statusBarOrientationChange:(NSNotification *)notification{
    self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 77);
}

-(void)addGestureRecognizer{
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesture:)];
    swipeGesture.direction = UISwipeGestureRecognizerDirectionUp;
    [self addGestureRecognizer:swipeGesture];

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    [self addGestureRecognizer:tapGesture];
}

-(void)tapGesture:(UITapGestureRecognizer*)tapGesture{
    [[NSNotificationCenter defaultCenter] postNotificationName:WZYBannerViewDidClick object:self.userInfo];
    [self removeWithAnimation];
}

-(void)swipeGesture:(UISwipeGestureRecognizer*)gesture{
    [self removeWithAnimation];
}

-(void)apperWithAnimation{
    if ([[WZYBannerView appRootViewController] isKindOfClass:[UINavigationController class]]) {
        UINavigationController *controller = (UINavigationController*)[WZYBannerView appRootViewController];
        controller.WZYForegroundNotificationStatusBarHidden = YES;
        controller.childViewControllerForStatusBarHidden.WZYForegroundNotificationStatusBarHidden = YES;
    }else{
        [WZYBannerView appRootViewController].WZYForegroundNotificationStatusBarHidden = YES;
    }
    self.frame = CGRectMake(0, 0, BannerWidth, 0);
    [UIView animateWithDuration:BannerAnimationTime animations:^{
        self.frame = CGRectMake(0, 0, BannerWidth, BannerHeight);
    } completion:^(BOOL finished) {
        self.frame = CGRectMake(0, 0, BannerWidth, BannerHeight);
    }];
}

-(void)removeWithAnimation{
    //anitamtion
    [UIView animateWithDuration:BannerAnimationTime animations:^{
        for (UIView *view in self.subviews) {
            CGRect frame = view.frame;
            [view removeConstraints:view.constraints];
            view.frame = frame;
        }
        [self removeConstraints:self.constraints];
        self.frame = CGRectMake(0, 0, BannerWidth, 0);
    } completion:^(BOOL finished) {
        self.frame = CGRectMake(0, 0, BannerWidth, 0);
        [self removeFromSuperview];
        if ([[WZYBannerView appRootViewController] isKindOfClass:[UINavigationController class]]) {
            UINavigationController *controller = (UINavigationController*)[WZYBannerView appRootViewController];
            controller.childViewControllerForStatusBarHidden.WZYForegroundNotificationStatusBarHidden = NO;
            controller.WZYForegroundNotificationStatusBarHidden = NO;
        }else{
            [WZYBannerView appRootViewController].WZYForegroundNotificationStatusBarHidden = YES;
        }
        SharedBannerView = nil;
    }];
}

+(UIViewController *)appRootViewController{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}

@end
