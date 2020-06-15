#import "logsWYZQHomeTaskThreeViewT.h"
@implementation logsWYZQHomeTaskThreeViewT
+ (BOOL)JInititem:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)FShowcontent:(NSInteger)logs {
    return logs % 18 == 0;
}
+ (BOOL)SclickPress:(NSInteger)logs {
    return logs % 43 == 0;
}

@end
