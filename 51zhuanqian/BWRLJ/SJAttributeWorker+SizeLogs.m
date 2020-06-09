#import "SJAttributeWorker+SizeLogs.h"
@implementation SJAttributeWorker (SizeLogs)
+ (BOOL)(void))sizeLogs:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)(NSRange))sizeByRangeLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)(double))sizeByHeightLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)(double))sizeByWidthLogs:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)sizeWithAttrStringWidthHeightLogs:(NSInteger)logs {
    return logs % 27 == 0;
}

@end
