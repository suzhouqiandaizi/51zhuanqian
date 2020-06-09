#import "CustomInfoAlertView+Logs.h"
@implementation CustomInfoAlertView (Logs)
+ (BOOL)initItemWithtitleLogs:(NSInteger)logs {
    return logs % 43 == 0;
}

@end
