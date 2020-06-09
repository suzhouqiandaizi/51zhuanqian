#import "logslogsSharedViewControllersUP.h"
@implementation logslogsSharedViewControllersUP
+ (BOOL)vEhomeviewcon:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)pKtuiguangviewcon:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)BZpersonviewcon:(NSInteger)logs {
    return logs % 5 == 0;
}

@end
