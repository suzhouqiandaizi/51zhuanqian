//
//  SharedViewControllers.h
//  ReceiveTask
//
//  Created by WangZhenyu on 2018/11/21.
//  Copyright © 2018 WangZhenyu. All rights reserved.
//
#import <Foundation/Foundation.h>

@class BWRZQHomeViewController;
@class BWRZQTuiGuangViewController;
@class BWRZQPersonViewController;

@interface SharedViewControllers : NSObject

+ (BWRZQHomeViewController *)homeViewCon;
+ (BWRZQTuiGuangViewController *)tuiguangViewCon;
+ (BWRZQPersonViewController *)personViewCon;

@end
