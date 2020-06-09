//
//  LoadConfig.m
//  ReceiveTask
//
//  Created by WangZhenyu on 2018/11/21.
//  Copyright © 2018 WangZhenyu. All rights reserved.
//

#import "LoadConfig.h"
#import "CacheData.h"
#import "AppDelegate.h"

#define EXAMINE_HOME               @"EXAMINE_HOME"
#define TOOLS                      @"TOOLS"
#define PERSON                     @"PERSON"
#define BANKAJINDU                 @"BANKAJINDU"
#define APPCONFIG                  @"APPCONFIG"
#define ABOUTOUR                   @"ABOUTOUR"
#define ACCOUNT                    @"ACCOUNT"
#define TASKCONFIGRUATION          @"TASKCONFIGRUATION"


@implementation LoadConfig

+ (instancetype)shareStance
{
    static dispatch_once_t onceToken;
    static LoadConfig* shared = nil;
    dispatch_once(&onceToken, ^{
        shared = [[LoadConfig alloc] init];
    });
    return shared;
}

- (void)loadConfigSuccess:(void (^)(NSDictionary *))success failure:(void (^)(NSString *))fail{
    __block NSDictionary *lastDic = [CacheData readApplicationDic:APPCONFIG];

    [[ServiceRequest sharedService] GET:@"configuration/config-data" parameters:@{@"dataUrl":[NSString stringWithFormat:@"%@%@", HOSTURL, @"/app_51zhuanqian/ios_config.json"]} success:^(NSDictionary *responseObject) {
        if ([lastDic count] > 0) {
            if (![responseObject isEqualToDictionary:lastDic]) {
                [CacheData writeApplicationData:responseObject writeFileName:APPCONFIG];
            }else{
            }
        }else{
            [CacheData writeApplicationData:responseObject writeFileName:APPCONFIG];
        }
        
        NSDictionary *taskConfig = [CacheData readApplicationDic:TASKCONFIGRUATION];
        [[ServiceRequest sharedService] GET:@"task/configuration" parameters:nil success:^(id components) {
            if ([taskConfig count] > 0) {
                if (![components isEqualToDictionary:taskConfig]) {
                    [CacheData writeApplicationData:components writeFileName:TASKCONFIGRUATION];
                    success(responseObject);
                }else{
                    success(responseObject);
                }
            }else{
                [CacheData writeApplicationData:components writeFileName:TASKCONFIGRUATION];
                success(responseObject);
            }
        } failure:^(NSString *error, NSInteger code) {
            NSArray *dic = [CacheData readApplicationDic:TASKCONFIGRUATION];
            if (dic.count > 0) {
                success(responseObject);
            }else{
                fail(@"请检查您的网络情况后重新打开APP");
            }
        }];
    } failure:^(NSString *error, NSInteger code) {
        NSDictionary *dic = [CacheData readApplicationDic:APPCONFIG];
        if (dic.count > 0) {
            success(dic);
        }else{
            fail(@"请检查您的网络情况后重新打开APP");
        }
    }];
}

- (void)loadLoginConfigSuccess:(void (^)(NSDictionary *))success failure:(void (^)(NSString *))fail{
    __block NSDictionary *lastDic = [CacheData readApplicationDic:APPCONFIG];

    [[ServiceRequest sharedService] GET:@"configuration/config-data" parameters:@{@"dataUrl":[NSString stringWithFormat:@"%@%@", HOSTURL, @"/app_51zhuanqian/ios_config.json"]} success:^(NSDictionary *responseObject) {
        if ([lastDic count] > 0) {
            if (![responseObject isEqualToDictionary:lastDic]) {
                [CacheData writeApplicationData:responseObject writeFileName:APPCONFIG];
            }else{
            }
        }else{
            [CacheData writeApplicationData:responseObject writeFileName:APPCONFIG];
        }
        success(responseObject);
    } failure:^(NSString *error, NSInteger code) {
        NSDictionary *dic = [CacheData readApplicationDic:APPCONFIG];
        if (dic.count > 0) {
            success(dic);
        }else{
            fail(@"请检查您的网络情况后重新打开APP");
        }
    }];
}

- (NSDictionary *)getConfig{
    return [CacheData readApplicationDic:APPCONFIG];
}

- (NSArray *)getTaskHomeCategory{
    return [[CacheData readApplicationDic:TASKCONFIGRUATION] objectForKey:@"indexComponents"];
}

- (NSArray *)getTaskOptioins{
    return [[CacheData readApplicationDic:TASKCONFIGRUATION] objectForKey:@"sortValueOptions"];
}

- (NSArray *)getTaskClassify{
    return [[CacheData readApplicationDic:TASKCONFIGRUATION] objectForKey:@"categories"];
}

- (void)loadAboutSuccess:(void (^)(NSDictionary *))success{
    [[ServiceRequest sharedService] GET:@"configuration/config-data" parameters:@{@"dataUrl":[NSString stringWithFormat:@"%@%@", HOSTURL, @"/app_51zhuanqian/about.json"]} success:^(NSDictionary *responseObject) {
        NSDictionary *dic = [CacheData readApplicationDic:ABOUTOUR];
        if (![responseObject isEqualToDictionary:dic]) {
            [CacheData writeApplicationData:responseObject writeFileName:ABOUTOUR];
            success(responseObject);
        }
    } failure:^(NSString *error, NSInteger code) {
        NSDictionary *dic = [CacheData readApplicationDic:ABOUTOUR];
        if (dic.count > 0) {
            
        }else{
            AppDelegate *del = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            [del.navigationController showHUDAlert:error];
        }
    }];
}

- (NSDictionary *)getAbout{
    return [CacheData readApplicationDic:ABOUTOUR];
}

- (void)loadAccountSuccess:(void (^)(NSDictionary *))success{
    UserInfo *user = [UserManger currentLoggedInUser];
    [[ServiceRequest sharedService] GET:[NSString stringWithFormat:@"user/%@/account", user.phone] parameters:nil success:^(NSDictionary *responseObject) {
        NSDictionary *dic = [CacheData readApplicationDic:ACCOUNT];
        if (![responseObject isEqualToDictionary:dic]) {
            [CacheData writeApplicationData:responseObject writeFileName:ACCOUNT];
            success(responseObject);
        }
    } failure:^(NSString *error, NSInteger code) {

    }];
}

- (NSDictionary *)getAccount{
    return [CacheData readApplicationDic:ACCOUNT];
}

- (void)exitApp{
    exit(0);
}

@end
