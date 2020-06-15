//
//  SharedViewControllers.h
//  ReceiveTask
//
//  Created by WangZhenyu on 2018/11/21.
//  Copyright © 2018 WangZhenyu. All rights reserved.
//
#import <Foundation/Foundation.h>

@class WYZQHomeViewController;
@class WYZQTuiGuangViewController;
@class WYZQPersonViewController;

@interface SharedViewControllers : NSObject

+ (WYZQHomeViewController *)homeViewCon;
+ (WYZQTuiGuangViewController *)tuiguangViewCon;
+ (WYZQPersonViewController *)personViewCon;

@end
