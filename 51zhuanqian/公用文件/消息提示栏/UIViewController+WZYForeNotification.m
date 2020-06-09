//
//  UIViewController+WZYForeNotification.m
//  iOS-Foreground-Push-Notification
//
//  Created by WangZhenyu on 16/7/27.
//  Copyright © 2016年 WangZhenyu. All rights reserved.
//

#import "UIViewController+WZYForeNotification.h"
#import <objc/runtime.h>

@implementation UIViewController (WZYForeNotification)

static BOOL _WZYForegroundNotificationStatusBarHidden;

- (void)setWZYForegroundNotificationStatusBarHidden:(BOOL)WZYForegroundNotificationStatusBarHidden{
    NSNumber *t = @(WZYForegroundNotificationStatusBarHidden);
    objc_setAssociatedObject(self, &_WZYForegroundNotificationStatusBarHidden, t, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setNeedsStatusBarAppearanceUpdate];
}

- (BOOL)WZYForegroundNotificationStatusBarHidden{
    NSNumber *t = objc_getAssociatedObject(self, &_WZYForegroundNotificationStatusBarHidden);
    return [t boolValue];
}

#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
-(BOOL)prefersStatusBarHidden{
    return self.WZYForegroundNotificationStatusBarHidden;
}

@end
 
