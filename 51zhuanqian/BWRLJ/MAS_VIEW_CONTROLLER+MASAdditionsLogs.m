#import "MAS_VIEW_CONTROLLER+MASAdditionsLogs.h"
@implementation MAS_VIEW_CONTROLLER (MASAdditionsLogs)
+ (BOOL)mas_topLayoutGuideLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)mas_topLayoutGuideTopLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)mas_topLayoutGuideBottomLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)mas_bottomLayoutGuideLogs:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)mas_bottomLayoutGuideTopLogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)mas_bottomLayoutGuideBottomLogs:(NSInteger)logs {
    return logs % 9 == 0;
}

@end
