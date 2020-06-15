//
//  SharedViewControllers.m
//  ReceiveTask
//
//  Created by WangZhenyu on 2018/11/21.
//  Copyright © 2018 WangZhenyu. All rights reserved.
//

#import "SharedViewControllers.h"
#import "WYZQHomeViewController.h"
#import "WYZQTuiGuangViewController.h"
#import "WYZQPersonViewController.h"

@implementation SharedViewControllers

+ (WYZQHomeViewController *)homeViewCon{
    static WYZQHomeViewController *kViewCon = nil;
    if (!kViewCon) {
        kViewCon = [[WYZQHomeViewController alloc] initWithNibName:@"WYZQHomeViewController" bundle:nil];
    }
    return kViewCon;
}

+ (WYZQTuiGuangViewController *)tuiguangViewCon{
    static WYZQTuiGuangViewController *kViewCon = nil;
    if (!kViewCon) {
        kViewCon = [[WYZQTuiGuangViewController alloc] initWithNibName:@"WYZQTuiGuangViewController" bundle:nil];
    }
    return kViewCon;
}

+ (WYZQPersonViewController *)personViewCon{
    static WYZQPersonViewController *kViewCon = nil;
    if (!kViewCon) {
        kViewCon = [[WYZQPersonViewController alloc] initWithNibName:@"WYZQPersonViewController" bundle:nil];
    }
    return kViewCon;
}

@end
