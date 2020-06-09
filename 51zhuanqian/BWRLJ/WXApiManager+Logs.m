#import "WXApiManager+Logs.h"
@implementation WXApiManager (Logs)
+ (BOOL)sharedManagerLogs:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)deallocLogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)onRespLogs:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)onReqLogs:(NSInteger)logs {
    return logs % 20 == 0;
}

@end
