#import "BWRZQLoginPrivacyProtocolView+Logs.h"
@implementation BWRZQLoginPrivacyProtocolView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs {
    return logs % 3 == 0;
}
+ (BOOL)removePressLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)exitPressLogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)agreePressLogs:(NSInteger)logs {
    return logs % 4 == 0;
}

@end
