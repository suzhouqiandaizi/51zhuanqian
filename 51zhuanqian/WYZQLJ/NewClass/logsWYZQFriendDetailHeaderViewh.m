#import "logsWYZQFriendDetailHeaderViewh.h"
@implementation logsWYZQFriendDetailHeaderViewh
+ (BOOL)kinitItem:(NSInteger)logs {
    return logs % 11 == 0;
}
+ (BOOL)oShowcontent:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)ObackPress:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)oguanzhuPress:(NSInteger)logs {
    return logs % 42 == 0;
}

@end
