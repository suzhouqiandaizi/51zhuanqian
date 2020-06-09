#import <Foundation/Foundation.h>
#import "UserManger.h"
#import "UserInfo.h"
#import "NSString_extesion.h"
#import "JPUSHService.h"
#import "LoadConfig.h"

@interface UserManger (Logs)
+ (BOOL)initDictionaryLogs:(NSInteger)logs;
+ (BOOL)getUserWithIdLogs:(NSInteger)logs;
+ (BOOL)setUserLogs:(NSInteger)logs;
+ (BOOL)saveDataLogs:(NSInteger)logs;
+ (BOOL)currentLoggedInUserLogs:(NSInteger)logs;
+ (BOOL)hasUserLoggedLogs:(NSInteger)logs;
+ (BOOL)logoutCurrentUserLogs:(NSInteger)logs;
+ (BOOL)saveClientIdLogs:(NSInteger)logs;
+ (BOOL)getClientIdLogs:(NSInteger)logs;
+ (BOOL)getServerUrlLogs:(NSInteger)logs;

@end
