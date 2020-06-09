#import "CustomSuccessAlertView+Logs.h"
@implementation CustomSuccessAlertView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs {
    return logs % 42 == 0;
}

@end
