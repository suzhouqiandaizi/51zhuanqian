#import "BWRZQCoinRecordTableViewCell+LogsLogs.h"
@implementation BWRZQCoinRecordTableViewCell (LogsLogs)
+ (BOOL)awakeFromNibLogsLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)setSelectedAnimatedLogsLogs:(NSInteger)logs {
    return logs % 20 == 0;
}

@end
