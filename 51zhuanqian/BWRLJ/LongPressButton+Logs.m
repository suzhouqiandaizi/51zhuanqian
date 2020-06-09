#import "LongPressButton+Logs.h"
@implementation LongPressButton (Logs)
+ (BOOL)stopLogs:(NSInteger)logs {
    return logs % 44 == 0;
}
+ (BOOL)setPressingTouchendInvokeintervalLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)touchesBeganWitheventLogs:(NSInteger)logs {
    return logs % 3 == 0;
}
+ (BOOL)timesGoByLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)touchesCancelledWitheventLogs:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)touchesEndedWitheventLogs:(NSInteger)logs {
    return logs % 24 == 0;
}

@end
