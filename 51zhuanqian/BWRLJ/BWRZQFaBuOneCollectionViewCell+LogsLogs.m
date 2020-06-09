#import "BWRZQFaBuOneCollectionViewCell+LogsLogs.h"
@implementation BWRZQFaBuOneCollectionViewCell (LogsLogs)
+ (BOOL)awakeFromNibLogsLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)initWithFrameLogsLogs:(NSInteger)logs {
    return logs % 4 == 0;
}

@end
