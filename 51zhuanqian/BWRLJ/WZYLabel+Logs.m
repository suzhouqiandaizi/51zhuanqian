#import "WZYLabel+Logs.h"
@implementation WZYLabel (Logs)
+ (BOOL)setShouldGestureRecognizerLogs:(NSInteger)logs {
    return logs % 34 == 0;
}
+ (BOOL)longPressGestureRecognizedLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)canBecomeFirstResponderLogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)canPerformActionWithsenderLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)cutLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)copyLogs:(NSInteger)logs {
    return logs % 11 == 0;
}
+ (BOOL)pasteLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)yaoqingLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)shareLogs:(NSInteger)logs {
    return logs % 1 == 0;
}

@end
