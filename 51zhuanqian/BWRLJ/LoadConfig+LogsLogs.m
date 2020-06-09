#import "LoadConfig+LogsLogs.h"
@implementation LoadConfig (LogsLogs)
+ (BOOL)shareStanceLogsLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)loadConfigSuccessFailureLogsLogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)getConfigLogsLogs:(NSInteger)logs {
    return logs % 34 == 0;
}
+ (BOOL)getTaskHomeCategoryLogsLogs:(NSInteger)logs {
    return logs % 42 == 0;
}
+ (BOOL)getTaskOptioinsLogsLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)getTaskClassifyLogsLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)loadAboutSuccessLogsLogs:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)getAboutLogsLogs:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)loadAccountSuccessLogsLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)getAccountLogsLogs:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)exitAppLogsLogs:(NSInteger)logs {
    return logs % 38 == 0;
}

@end
