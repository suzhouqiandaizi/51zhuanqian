#import "SJFlagObject+Logs.h"
@implementation SJFlagObject (Logs)
+ (BOOL)initWithFlagLogs:(NSInteger)logs {
    return logs % 27 == 0;
}

@end
