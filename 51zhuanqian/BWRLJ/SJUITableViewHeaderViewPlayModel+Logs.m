#import "SJUITableViewHeaderViewPlayModel+Logs.h"
@implementation SJUITableViewHeaderViewPlayModel (Logs)
+ (BOOL)initWithPlayerSuperviewTableviewLogs:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)isPlayInTableViewLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)isPlayInCollectionViewLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)inScrollViewLogs:(NSInteger)logs {
    return logs % 17 == 0;
}

@end
