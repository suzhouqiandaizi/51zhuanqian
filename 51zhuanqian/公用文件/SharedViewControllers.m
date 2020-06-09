//
//  SharedViewControllers.m
//  ReceiveTask
//
//  Created by WangZhenyu on 2018/11/21.
//  Copyright © 2018 WangZhenyu. All rights reserved.
//

#import "SharedViewControllers.h"
#import "BWRZQHomeViewController.h"
#import "BWRZQTuiGuangViewController.h"
#import "BWRZQPersonViewController.h"

@implementation SharedViewControllers

+ (BWRZQHomeViewController *)homeViewCon{
    static BWRZQHomeViewController *kViewCon = nil;
    if (!kViewCon) {
        kViewCon = [[BWRZQHomeViewController alloc] initWithNibName:@"BWRZQHomeViewController" bundle:nil];
    }
    return kViewCon;
}

+ (BWRZQTuiGuangViewController *)tuiguangViewCon{
    static BWRZQTuiGuangViewController *kViewCon = nil;
    if (!kViewCon) {
        kViewCon = [[BWRZQTuiGuangViewController alloc] initWithNibName:@"BWRZQTuiGuangViewController" bundle:nil];
    }
    return kViewCon;
}

+ (BWRZQPersonViewController *)personViewCon{
    static BWRZQPersonViewController *kViewCon = nil;
    if (!kViewCon) {
        kViewCon = [[BWRZQPersonViewController alloc] initWithNibName:@"BWRZQPersonViewController" bundle:nil];
    }
    return kViewCon;
}

@end
