#import "logslogsBWRZQFriendDetailHeaderViewPB.h"
@implementation logslogsBWRZQFriendDetailHeaderViewPB
+ (BOOL)LQinititem:(NSInteger)logs {
    return logs % 26 == 0;
}
+ (BOOL)jMshowcontent:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)SFbackpress:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)AOguanzhupress:(NSInteger)logs {
    return logs % 26 == 0;
}

@end
