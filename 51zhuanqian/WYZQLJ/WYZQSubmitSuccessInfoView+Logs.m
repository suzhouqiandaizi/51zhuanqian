#import "WYZQSubmitSuccessInfoView+Logs.h"
@implementation WYZQSubmitSuccessInfoView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)removePressLogs:(NSInteger)logs {
    return logs % 24 == 0;
}

@end
