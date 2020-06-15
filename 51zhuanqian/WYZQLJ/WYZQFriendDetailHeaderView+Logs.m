#import "WYZQFriendDetailHeaderView+Logs.h"
@implementation WYZQFriendDetailHeaderView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs {
    return logs % 43 == 0;
}
+ (BOOL)showContentLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)backPressLogs:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)guanzhuPressLogs:(NSInteger)logs {
    return logs % 28 == 0;
}

@end
