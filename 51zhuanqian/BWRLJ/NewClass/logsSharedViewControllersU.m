#import "logsSharedViewControllersU.h"
@implementation logsSharedViewControllersU
+ (BOOL)ehomeViewCon:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)ktuiguangViewCon:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)zpersonViewCon:(NSInteger)logs {
    return logs % 45 == 0;
}

@end
