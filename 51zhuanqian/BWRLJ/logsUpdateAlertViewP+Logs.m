#import "logsUpdateAlertViewP+Logs.h"
@implementation logsUpdateAlertViewP (Logs)
+ (BOOL)BInititemlogsLogs:(NSInteger)logs {
    return logs % 15 == 0;
}
+ (BOOL)RRemovepresslogsLogs:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)sSurepresslogsLogs:(NSInteger)logs {
    return logs % 3 == 0;
}

@end
