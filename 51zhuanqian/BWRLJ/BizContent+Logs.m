#import "BizContent+Logs.h"
@implementation BizContent (Logs)
+ (BOOL)descriptionLogs:(NSInteger)logs {
    return logs % 4 == 0;
}

@end
