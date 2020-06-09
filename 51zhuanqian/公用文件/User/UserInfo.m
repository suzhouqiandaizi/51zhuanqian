//
//  UserInfo.m
//  ReceiveTask
//
//  Created by WangZhenyu on 2018/11/21.
//  Copyright © 2018 WangZhenyu. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

- (id)init{
    self = [super init];
    if(self)
    {
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.token forKey:@"token"];
    [aCoder encodeObject:self.userID forKey:@"userID"];
    [aCoder encodeObject:self.phone forKey:@"phone"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.nickname forKey:@"nickname"];
    [aCoder encodeObject:self.avatar forKey:@"avatar"];
    [aCoder encodeObject:self.availableAmount forKey:@"availableAmount"];
    [aCoder encodeObject:self.yaoqingma forKey:@"yaoqingma"];
    [aCoder encodeObject:self.availableJinbi forKey:@"availableJinbi"];
    
}


- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.token = [aDecoder decodeObjectForKey:@"token"];
        self.userID = [aDecoder decodeObjectForKey:@"userID"];
        self.phone = [aDecoder decodeObjectForKey:@"phone"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.avatar = [aDecoder decodeObjectForKey:@"avatar"];
        self.nickname = [aDecoder decodeObjectForKey:@"nickname"];
        self.availableAmount = [aDecoder decodeObjectForKey:@"availableAmount"];
        self.yaoqingma = [aDecoder decodeObjectForKey:@"yaoqingma"];
        self.availableJinbi = [aDecoder decodeObjectForKey:@"availableJinbi"];
    }
    return self;
}


@end
