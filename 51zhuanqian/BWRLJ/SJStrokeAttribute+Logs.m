#import "SJStrokeAttribute+Logs.h"
@implementation SJStrokeAttribute (Logs)
+ (BOOL)strokeWithValueColorLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)initWithValueColorLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)mutableCopyWithZoneLogs:(NSInteger)logs {
    return logs % 39 == 0;
}

@end
