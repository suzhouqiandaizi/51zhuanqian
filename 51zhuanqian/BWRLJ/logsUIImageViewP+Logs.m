#import "logsUIImageViewP+Logs.h"
@implementation logsUIImageViewP (Logs)
+ (BOOL)SaddGestureRecognizerHandlePersonDetailLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)lSetpersonidLogs:(NSInteger)logs {
    return logs % 18 == 0;
}
+ (BOOL)bhandleToPersonDetailLogs:(NSInteger)logs {
    return logs % 30 == 0;
}

@end
