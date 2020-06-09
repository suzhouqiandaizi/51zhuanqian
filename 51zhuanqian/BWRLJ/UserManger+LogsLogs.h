#import <Foundation/Foundation.h>
#import "UserManger.h"
#import "UserInfo.h"
#import "NSString_extesion.h"
#import "JPUSHService.h"
#import "LoadConfig.h"
#import "UserManger+Logs.h"

@interface UserManger (LogsLogs)
+ (BOOL)initDictionaryLogsLogs:(NSInteger)logs;
+ (BOOL)getUserWithIdLogsLogs:(NSInteger)logs;
+ (BOOL)setUserLogsLogs:(NSInteger)logs;
+ (BOOL)saveDataLogsLogs:(NSInteger)logs;
+ (BOOL)currentLoggedInUserLogsLogs:(NSInteger)logs;
+ (BOOL)hasUserLoggedLogsLogs:(NSInteger)logs;
+ (BOOL)logoutCurrentUserLogsLogs:(NSInteger)logs;
+ (BOOL)saveClientIdLogsLogs:(NSInteger)logs;
+ (BOOL)getClientIdLogsLogs:(NSInteger)logs;
+ (BOOL)getServerUrlLogsLogs:(NSInteger)logs;

@end
