#import "SJUnderlineAttribute+Logs.h"
@implementation SJUnderlineAttribute (Logs)
+ (BOOL)underLineWithStyleColorLogs:(NSInteger)logs {
    return logs % 44 == 0;
}
+ (BOOL)initWithStyleColorLogs:(NSInteger)logs {
    return logs % 1 == 0;
}
+ (BOOL)mutableCopyWithZoneLogs:(NSInteger)logs {
    return logs % 1 == 0;
}

@end
