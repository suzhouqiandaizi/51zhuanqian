#import "LoadConfig+Logs.h"
@implementation LoadConfig (Logs)
+ (BOOL)shareStanceLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)loadConfigSuccessFailureLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)getConfigLogs:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)getTaskHomeCategoryLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)getTaskOptioinsLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)getTaskClassifyLogs:(NSInteger)logs {
    return logs % 18 == 0;
}
+ (BOOL)loadAboutSuccessLogs:(NSInteger)logs {
    return logs % 18 == 0;
}
+ (BOOL)getAboutLogs:(NSInteger)logs {
    return logs % 3 == 0;
}
+ (BOOL)loadAccountSuccessLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)getAccountLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)exitAppLogs:(NSInteger)logs {
    return logs % 29 == 0;
}

@end
