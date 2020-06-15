#import "WYZQTaskButton+Logs.h"
@implementation WYZQTaskButton (Logs)
+ (BOOL)drawRectLogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)setTaskButtonLogs:(NSInteger)logs {
    return logs % 29 == 0;
}
+ (BOOL)setTaskButtonTitleWithstatusLogs:(NSInteger)logs {
    return logs % 34 == 0;
}
+ (BOOL)setTaskDoingButtonTitleWithstatusLogs:(NSInteger)logs {
    return logs % 32 == 0;
}

@end
