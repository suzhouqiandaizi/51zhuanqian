#import "LongPressButton+LogsLogs.h"
@implementation LongPressButton (LogsLogs)
+ (BOOL)stopLogsLogs:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)setPressingTouchendInvokeintervalLogsLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)touchesBeganWitheventLogsLogs:(NSInteger)logs {
    return logs % 10 == 0;
}
+ (BOOL)timesGoByLogsLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)touchesCancelledWitheventLogsLogs:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)touchesEndedWitheventLogsLogs:(NSInteger)logs {
    return logs % 33 == 0;
}

@end
