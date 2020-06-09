#import "BWRZQAttentionFunsTableViewCell+LogsLogs.h"
@implementation BWRZQAttentionFunsTableViewCell (LogsLogs)
+ (BOOL)awakeFromNibLogsLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)setSelectedAnimatedLogsLogs:(NSInteger)logs {
    return logs % 4 == 0;
}

@end
