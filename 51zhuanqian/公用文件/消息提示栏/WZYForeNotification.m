//
//  WZYForeNotification.m
//  iOS-Foreground-Push-Notification
//
//  Created by WangZhenyu on 16/7/27.
//  Copyright © 2016年 WangZhenyu. All rights reserved.
//

#import "WZYForeNotification.h"
#import <AudioToolbox/AudioToolbox.h>
#import <UIKit/UIKit.h>
#import "WZYBannerView.h"
#import "UIViewController+WZYForeNotification.h"

NSString *const WZYBannerViewDidClick = @"WZYBannerViewDidClick";

@implementation WZYForeNotification

#pragma mark - public

+(void)handleRemoteNotification:(NSDictionary*)userInfo soundID:(int)soundID{
    if (userInfo) {
        [WZYBannerView class];
        id aps = [userInfo valueForKey:@"aps"];
        if (aps && [aps isKindOfClass:[NSDictionary class]] && [aps valueForKey:@"alert"] && ![[aps valueForKey:@"alert"] isEqual: @""]) {
            [WZYForeNotification showBannerWithUserInfo:userInfo soundID:soundID];
        }
    }
}

+(void)handleRemoteNotification:(NSDictionary*)userInfo customSound:(NSString*)soundName{
    if (soundName) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:soundName withExtension:nil];
        SystemSoundID soundID = 0;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)(url), &soundID);
        [WZYForeNotification handleRemoteNotification:userInfo soundID:soundID];
    }
}

#pragma mark - private

+(void)showBannerWithUserInfo:(NSDictionary*)userInfo soundID:(int)soundID{
    if (soundID) {
        AudioServicesPlaySystemSound(soundID);
    }
    if (timer) {
        [timer invalidate];
        timer = nil;
    }
    UIViewController *controller = [WZYForeNotification appRootViewController];
    if (SharedBannerView && [controller.view.subviews containsObject:SharedBannerView]) {
        SharedBannerView.userInfo = userInfo;
    }else{
        SharedBannerView = nil;
        SharedBannerView = [[NSBundle mainBundle] loadNibNamed:@"WZYBannerView" owner:nil options:nil].lastObject;
        SharedBannerView.userInfo = userInfo;
        [controller.view addSubview:SharedBannerView];

    }
    timer = [NSTimer scheduledTimerWithTimeInterval:BannerStayTime target:self selector:@selector(deletWZYanner) userInfo:nil repeats:NO];
}

+(UIViewController *)appRootViewController{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}

+(void)deletWZYanner{
    if (SharedBannerView) {
        [SharedBannerView removeWithAnimation];
    }
}

@end
