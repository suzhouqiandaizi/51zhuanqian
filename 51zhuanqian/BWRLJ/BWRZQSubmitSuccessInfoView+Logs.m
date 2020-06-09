#import "BWRZQSubmitSuccessInfoView+Logs.h"
@implementation BWRZQSubmitSuccessInfoView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)removePressLogs:(NSInteger)logs {
    return logs % 34 == 0;
}

@end
