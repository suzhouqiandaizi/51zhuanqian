#import "BWRZQFriendDetailHeaderView+LogsLogs.h"
@implementation BWRZQFriendDetailHeaderView (LogsLogs)
+ (BOOL)initItemLogsLogs:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)showContentLogsLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)backPressLogsLogs:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)guanzhuPressLogsLogs:(NSInteger)logs {
    return logs % 31 == 0;
}

@end
