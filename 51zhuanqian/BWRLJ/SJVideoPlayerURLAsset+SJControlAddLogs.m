#import "SJVideoPlayerURLAsset+SJControlAddLogs.h"
@implementation SJVideoPlayerURLAsset (SJControlAddLogs)
+ (BOOL)initWithTitleUrlPlaymodelLogs:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)initWithTitleUrlSpecifystarttimePlaymodelLogs:(NSInteger)logs {
    return logs % 1 == 0;
}
+ (BOOL)setTitleLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)titleLogs:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)initWithAttributedTitleUrlPlaymodelLogs:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)initWithAttributedTitleUrlSpecifystarttimePlaymodelLogs:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)setAttributedTitleLogs:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)attributedTitleLogs:(NSInteger)logs {
    return logs % 46 == 0;
}

@end
