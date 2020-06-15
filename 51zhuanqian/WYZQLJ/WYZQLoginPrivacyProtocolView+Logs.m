#import "WYZQLoginPrivacyProtocolView+Logs.h"
@implementation WYZQLoginPrivacyProtocolView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)removePressLogs:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)exitPressLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)agreePressLogs:(NSInteger)logs {
    return logs % 7 == 0;
}

@end
