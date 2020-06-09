#import "SJEdgeControlButtonItem+Logs.h"
@implementation SJEdgeControlButtonItem (Logs)
+ (BOOL)initWithTitleTargetActionTagLogs:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)initWithImageTargetActionTagLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)initWithCustomViewTagLogs:(NSInteger)logs {
    return logs % 15 == 0;
}
+ (BOOL)initWithTagLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)addTargetActionLogs:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)performActionLogs:(NSInteger)logs {
    return logs % 17 == 0;
}

@end
