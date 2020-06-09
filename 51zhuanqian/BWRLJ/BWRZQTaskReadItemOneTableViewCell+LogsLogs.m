#import "BWRZQTaskReadItemOneTableViewCell+LogsLogs.h"
@implementation BWRZQTaskReadItemOneTableViewCell (LogsLogs)
+ (BOOL)awakeFromNibLogsLogs:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)setSelectedAnimatedLogsLogs:(NSInteger)logs {
    return logs % 46 == 0;
}

@end
