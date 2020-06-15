#import "logsWYZQHomeTaskOneViewq.h"
@implementation logsWYZQHomeTaskOneViewq
+ (BOOL)bInititem:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)bShowcontent:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)bclickPress:(NSInteger)logs {
    return logs % 18 == 0;
}

@end
