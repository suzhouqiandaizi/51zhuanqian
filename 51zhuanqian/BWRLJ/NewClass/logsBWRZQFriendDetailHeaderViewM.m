#import "logsBWRZQFriendDetailHeaderViewM.h"
@implementation logsBWRZQFriendDetailHeaderViewM
+ (BOOL)wInititemlogs:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)IShowcontentlogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)UBackpresslogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)FGuanzhupresslogs:(NSInteger)logs {
    return logs % 2 == 0;
}

@end
