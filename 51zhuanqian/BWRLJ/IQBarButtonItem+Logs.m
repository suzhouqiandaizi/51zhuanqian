#import "IQBarButtonItem+Logs.h"
@implementation IQBarButtonItem (Logs)
+ (BOOL)initializeLogs:(NSInteger)logs {
    return logs % 3 == 0;
}
+ (BOOL)setTintColorLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)initWithBarButtonSystemItemTargetActionLogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)setTargetActionLogs:(NSInteger)logs {
    return logs % 38 == 0;
}

@end
