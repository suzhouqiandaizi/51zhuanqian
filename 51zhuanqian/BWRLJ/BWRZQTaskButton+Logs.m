#import "BWRZQTaskButton+Logs.h"
@implementation BWRZQTaskButton (Logs)
+ (BOOL)drawRectLogs:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)setTaskButtonLogs:(NSInteger)logs {
    return logs % 29 == 0;
}
+ (BOOL)setTaskButtonTitleWithstatusLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)setTaskDoingButtonTitleWithstatusLogs:(NSInteger)logs {
    return logs % 47 == 0;
}

@end
