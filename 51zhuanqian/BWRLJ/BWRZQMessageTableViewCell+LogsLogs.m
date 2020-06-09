#import "BWRZQMessageTableViewCell+LogsLogs.h"
@implementation BWRZQMessageTableViewCell (LogsLogs)
+ (BOOL)awakeFromNibLogsLogs:(NSInteger)logs {
    return logs % 9 == 0;
}
+ (BOOL)setSelectedAnimatedLogsLogs:(NSInteger)logs {
    return logs % 41 == 0;
}

@end
