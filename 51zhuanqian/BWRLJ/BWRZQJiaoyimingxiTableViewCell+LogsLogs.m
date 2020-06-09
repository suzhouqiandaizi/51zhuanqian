#import "BWRZQJiaoyimingxiTableViewCell+LogsLogs.h"
@implementation BWRZQJiaoyimingxiTableViewCell (LogsLogs)
+ (BOOL)awakeFromNibLogsLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)setSelectedAnimatedLogsLogs:(NSInteger)logs {
    return logs % 3 == 0;
}

@end
