#import "logsUserInfod+Logs.h"
@implementation logsUserInfod (Logs)
+ (BOOL)WinitLogs:(NSInteger)logs {
    return logs % 43 == 0;
}
+ (BOOL)UEncodewithcoderLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)xInitwithcoderLogs:(NSInteger)logs {
    return logs % 34 == 0;
}

@end
