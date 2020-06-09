#import "TAAnimatedDotView+Logs.h"
@implementation TAAnimatedDotView (Logs)
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)initWithFrameLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)initWithCoderLogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)setDotColorLogs:(NSInteger)logs {
    return logs % 10 == 0;
}
+ (BOOL)initializationLogs:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)changeActivityStateLogs:(NSInteger)logs {
    return logs % 1 == 0;
}
+ (BOOL)animateToActiveStateLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)animateToDeactiveStateLogs:(NSInteger)logs {
    return logs % 37 == 0;
}

@end
