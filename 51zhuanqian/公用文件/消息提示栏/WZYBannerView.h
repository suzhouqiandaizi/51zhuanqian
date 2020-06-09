//
//  WZYBannerView.h
//  iOS-Foreground-Push-Notification
//
//  Created by WangZhenyu on 16/7/27.
//  Copyright © 2016年 WangZhenyu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define BannerStayTime 4.7
#define BannerAnimationTime 0.3

@interface WZYBannerView : UIView
@property (nonatomic, retain)NSDictionary *userInfo;
-(void)removeWithAnimation;
@end

static WZYBannerView *SharedBannerView;
static NSTimer *timer;
