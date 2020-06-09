#import "UserManger+LogsLogs.h"
@implementation UserManger (LogsLogs)
+ (BOOL)initDictionaryLogsLogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)getUserWithIdLogsLogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)setUserLogsLogs:(NSInteger)logs {
    return logs % 9 == 0;
}
+ (BOOL)saveDataLogsLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)currentLoggedInUserLogsLogs:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)hasUserLoggedLogsLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)logoutCurrentUserLogsLogs:(NSInteger)logs {
    return logs % 1 == 0;
}
+ (BOOL)saveClientIdLogsLogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)getClientIdLogsLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)getServerUrlLogsLogs:(NSInteger)logs {
    return logs % 25 == 0;
}

@end
