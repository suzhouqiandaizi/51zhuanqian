//
//  UserInfo.h
//  ReceiveTask
//
//  Created by WangZhenyu on 2018/11/21.
//  Copyright © 2018 WangZhenyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject

///用户ID
@property (nonatomic, strong) NSString *userID;
///用户Token
@property (nonatomic, strong) NSString *token;
///用户真实姓名
@property (nonatomic, strong) NSString *name;
///用户昵称
@property (nonatomic, strong) NSString *nickname;
///用户头像
@property (nonatomic, strong) NSString *avatar;
///用户手机号
@property (nonatomic, strong) NSString *phone;
///可用金额
@property (strong, nonatomic) NSString *availableAmount;
///可用金币
@property (strong, nonatomic) NSString *availableJinbi;
///邀请码
@property (strong, nonatomic) NSString *yaoqingma;

@end
