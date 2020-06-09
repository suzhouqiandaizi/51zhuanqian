#import "BWRZQFriendDetailHeaderView+Logs.h"
@implementation BWRZQFriendDetailHeaderView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)showContentLogs:(NSInteger)logs {
    return logs % 44 == 0;
}
+ (BOOL)backPressLogs:(NSInteger)logs {
    return logs % 42 == 0;
}
+ (BOOL)guanzhuPressLogs:(NSInteger)logs {
    return logs % 37 == 0;
}

@end
