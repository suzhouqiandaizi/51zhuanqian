#import "BWRZQShouTuDetailTableViewCell+LogsLogs.h"
@implementation BWRZQShouTuDetailTableViewCell (LogsLogs)
+ (BOOL)awakeFromNibLogsLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)setSelectedAnimatedLogsLogs:(NSInteger)logs {
    return logs % 42 == 0;
}

@end
