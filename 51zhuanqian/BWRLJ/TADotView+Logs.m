#import "TADotView+Logs.h"
@implementation TADotView (Logs)
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)initWithFrameLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)initWithCoderLogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)initializationLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)changeActivityStateLogs:(NSInteger)logs {
    return logs % 5 == 0;
}

@end
