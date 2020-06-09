#import "BWRZQTaskFabuResultTableViewCell+LogsLogs.h"
@implementation BWRZQTaskFabuResultTableViewCell (LogsLogs)
+ (BOOL)awakeFromNibLogsLogs:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)setSelectedAnimatedLogsLogs:(NSInteger)logs {
    return logs % 26 == 0;
}

@end
