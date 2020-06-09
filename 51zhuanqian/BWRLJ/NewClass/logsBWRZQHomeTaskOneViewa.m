#import "logsBWRZQHomeTaskOneViewa.h"
@implementation logsBWRZQHomeTaskOneViewa
+ (BOOL)wInititem:(NSInteger)logs {
    return logs % 43 == 0;
}
+ (BOOL)BShowcontent:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)DclickPress:(NSInteger)logs {
    return logs % 17 == 0;
}

@end
