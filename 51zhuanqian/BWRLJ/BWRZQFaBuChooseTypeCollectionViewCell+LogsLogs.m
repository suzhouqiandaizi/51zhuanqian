#import "BWRZQFaBuChooseTypeCollectionViewCell+LogsLogs.h"
@implementation BWRZQFaBuChooseTypeCollectionViewCell (LogsLogs)
+ (BOOL)awakeFromNibLogsLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)clickPressLogsLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)initWithFrameLogsLogs:(NSInteger)logs {
    return logs % 17 == 0;
}

@end
