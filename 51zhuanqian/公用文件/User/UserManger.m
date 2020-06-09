//
//  UserManger.m
//  ReceiveTask
//
//  Created by WangZhenyu on 2018/11/21.
//  Copyright © 2018 WangZhenyu. All rights reserved.
//

#import "UserManger.h"
#import "UserInfo.h"
#import "NSString_extesion.h"
#import "JPUSHService.h"
#import "LoadConfig.h"

static NSMutableDictionary *usersById = nil;
static NSString* clientId;

@implementation UserManger

+ (void)initDictionary{
    if (usersById == nil) {
        NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"USERINFO"];
        if (data != nil) {
            usersById = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        }
        if (usersById == nil) {
            usersById = [NSMutableDictionary dictionary];
        }
    }
}

+ (UserInfo*)getUserWithId:(NSString*)userId{
    [UserManger initDictionary];
    return [usersById objectForKey:userId];
}

+ (void)setUser:(UserInfo*)user{
    if (user.userID == nil) {
        return;
    }
    [usersById setObject:user forKey:user.userID];
    [UserManger saveData];
}

+ (void)saveData{
    [UserManger initDictionary];
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:usersById];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"USERINFO"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (UserInfo *)currentLoggedInUser
{
    if (((NSString *)[DEFAULTS objectForKey:USERID]).length > 0) {
        return [UserManger getUserWithId:[DEFAULTS objectForKey:USERID]];
    }else{
        return nil;
    }
}

+ (BOOL)hasUserLogged
{
    if (((NSString *)[DEFAULTS objectForKey:USERID]).length > 0) {
        return YES;
    }else{
        return NO;
    }
}

+ (void)logoutCurrentUser
{
    [DEFAULTS setObject:@"" forKey:USERID];
    [DEFAULTS synchronize];
    [JPUSHService deleteAlias:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
        
    } seq:0];
}

+ (void)saveClientId:(NSString*) clientId{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:clientId forKey:@"clientId"];
}

+ (NSString *)getClientId
{
    if (!clientId) {
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        clientId  = [prefs objectForKey:@"clientId"];
        if (clientId == nil) {
            clientId= [NSString UUIDString];
            [UserManger saveClientId:clientId];
        }
    }
    return clientId;
}

+ (NSString *)getServerUrl{
//#ifndef DEBUG
    return @"http://dev.shangjinxia.ltd/api/";
//#else
    return @"http://prod.shangjinxia.ltd/api/";
//#endif
}

@end
