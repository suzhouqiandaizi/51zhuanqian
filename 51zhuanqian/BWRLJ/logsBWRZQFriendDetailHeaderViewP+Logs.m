#import "logsBWRZQFriendDetailHeaderViewP+Logs.h"
@implementation logsBWRZQFriendDetailHeaderViewP (Logs)
+ (BOOL)qinitItemLogs:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)MShowcontentLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)FbackPressLogs:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)oguanzhuPressLogs:(NSInteger)logs {
    return logs % 41 == 0;
}

@end
