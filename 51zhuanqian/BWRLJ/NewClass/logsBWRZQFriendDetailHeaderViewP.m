#import "logsBWRZQFriendDetailHeaderViewP.h"
@implementation logsBWRZQFriendDetailHeaderViewP
+ (BOOL)qinitItem:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)MShowcontent:(NSInteger)logs {
    return logs % 3 == 0;
}
+ (BOOL)FbackPress:(NSInteger)logs {
    return logs % 42 == 0;
}
+ (BOOL)oguanzhuPress:(NSInteger)logs {
    return logs % 9 == 0;
}

@end
