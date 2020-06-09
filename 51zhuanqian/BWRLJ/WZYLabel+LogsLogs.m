#import "WZYLabel+LogsLogs.h"
@implementation WZYLabel (LogsLogs)
+ (BOOL)setShouldGestureRecognizerLogsLogs:(NSInteger)logs {
    return logs % 23 == 0;
}
+ (BOOL)longPressGestureRecognizedLogsLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)canBecomeFirstResponderLogsLogs:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)canPerformActionWithsenderLogsLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)cutLogsLogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)copyLogsLogs:(NSInteger)logs {
    return logs % 23 == 0;
}
+ (BOOL)pasteLogsLogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)yaoqingLogsLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)shareLogsLogs:(NSInteger)logs {
    return logs % 26 == 0;
}

@end
