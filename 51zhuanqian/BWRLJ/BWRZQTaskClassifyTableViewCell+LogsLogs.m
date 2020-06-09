#import "BWRZQTaskClassifyTableViewCell+LogsLogs.h"
@implementation BWRZQTaskClassifyTableViewCell (LogsLogs)
+ (BOOL)awakeFromNibLogsLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)setSelectedAnimatedLogsLogs:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)clickPressLogsLogs:(NSInteger)logs {
    return logs % 25 == 0;
}

@end
