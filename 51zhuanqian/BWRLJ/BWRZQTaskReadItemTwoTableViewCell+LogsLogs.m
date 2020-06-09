#import "BWRZQTaskReadItemTwoTableViewCell+LogsLogs.h"
@implementation BWRZQTaskReadItemTwoTableViewCell (LogsLogs)
+ (BOOL)awakeFromNibLogsLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)setSelectedAnimatedLogsLogs:(NSInteger)logs {
    return logs % 16 == 0;
}

@end
