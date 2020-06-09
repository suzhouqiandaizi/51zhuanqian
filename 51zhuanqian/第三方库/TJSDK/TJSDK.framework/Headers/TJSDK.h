//
//  TJSDK.h
//  TJSDK
//
//  Created by RyanWong on 2018/10/12.
//  Copyright © 2018 RyanWong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

//! Project version number for TJSDK.
FOUNDATION_EXPORT double TJSDKVersionNumber;

//! Project version string for TJSDK.
FOUNDATION_EXPORT const unsigned char TJSDKVersionString[];

@interface TJSDK : NSObject

/**
 注册SDK，在使用SDK前，先在AppDelegate中调用此方法。

 @param appId 媒体Id
 @param appKey 媒体Key
 */
+ (void)registerClientWithAppId:(NSString *)appId appKey:(NSString *)appKey udid:(NSString *)udid;

/**
 （选用）绑定用户唯一标识，可以把您的用户与我们的后台信息绑定起来。

 @param userId 用户唯一标识
 */
+ (void)setAppUserId:(NSString *)userId;

/**
 打开SDK列表

 @param vc 弹出列表的上一级ViewController
 */
+ (void)presentViewController:(UIViewController *)vc;

/**
 打开SDK任务详情页

 @param vc 弹出列表的上一级ViewController
 @param cplKey 具体任务的key
 */
+ (void)presentViewController:(UIViewController *)vc withCplKey:(NSString *)cplKey;

@end
