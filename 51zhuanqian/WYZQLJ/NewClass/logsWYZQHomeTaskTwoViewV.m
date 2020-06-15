#import "logsWYZQHomeTaskTwoViewV.h"
@implementation logsWYZQHomeTaskTwoViewV
+ (BOOL)cInititem:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)MShowcontent:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)hclickPress:(NSInteger)logs {
    return logs % 29 == 0;
}

@end
