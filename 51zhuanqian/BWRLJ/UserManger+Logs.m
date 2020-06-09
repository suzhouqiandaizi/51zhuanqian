#import "UserManger+Logs.h"
@implementation UserManger (Logs)
+ (BOOL)initDictionaryLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)getUserWithIdLogs:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)setUserLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)saveDataLogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)currentLoggedInUserLogs:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)hasUserLoggedLogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)logoutCurrentUserLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)saveClientIdLogs:(NSInteger)logs {
    return logs % 15 == 0;
}
+ (BOOL)getClientIdLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)getServerUrlLogs:(NSInteger)logs {
    return logs % 27 == 0;
}

@end
