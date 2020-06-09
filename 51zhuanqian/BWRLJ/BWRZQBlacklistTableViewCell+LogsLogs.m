#import "BWRZQBlacklistTableViewCell+LogsLogs.h"
@implementation BWRZQBlacklistTableViewCell (LogsLogs)
+ (BOOL)awakeFromNibLogsLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)setSelectedAnimatedLogsLogs:(NSInteger)logs {
    return logs % 15 == 0;
}
+ (BOOL)cancelPressLogsLogs:(NSInteger)logs {
    return logs % 50 == 0;
}

@end
