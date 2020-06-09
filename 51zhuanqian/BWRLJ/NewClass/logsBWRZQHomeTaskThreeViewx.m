#import "logsBWRZQHomeTaskThreeViewx.h"
@implementation logsBWRZQHomeTaskThreeViewx
+ (BOOL)jInititem:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)JShowcontent:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)xclickPress:(NSInteger)logs {
    return logs % 50 == 0;
}

@end
