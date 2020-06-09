//
//  UserManger.h
//  ReceiveTask
//
//  Created by WangZhenyu on 2018/11/21.
//  Copyright © 2018 WangZhenyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserInfo;

@interface UserManger : NSObject
///根据当前用户ID获取用户信息
+ (UserInfo*)getUserWithId:(NSString*)userId;
///保存用户信息
+ (void)setUser:(UserInfo*)user;
///获取当前登录用户信息
+ (UserInfo*)currentLoggedInUser;
///注销当前登录用户
+ (void)logoutCurrentUser;
///判断当前是否有用户登录
+ (BOOL)hasUserLogged;

+ (NSString *)getClientId;
+ (NSString *)getServerUrl;
@end
