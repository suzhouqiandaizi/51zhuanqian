#import "BWRZQHomeTableViewCell+LogsLogs.h"
@implementation BWRZQHomeTableViewCell (LogsLogs)
+ (BOOL)awakeFromNibLogsLogs:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)setSelectedAnimatedLogsLogs:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)showContentLogsLogs:(NSInteger)logs {
    return logs % 22 == 0;
}

@end
