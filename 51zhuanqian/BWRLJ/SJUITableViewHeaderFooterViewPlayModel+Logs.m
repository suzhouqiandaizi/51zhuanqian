#import "SJUITableViewHeaderFooterViewPlayModel+Logs.h"
@implementation SJUITableViewHeaderFooterViewPlayModel (Logs)
+ (BOOL)initWithPlayerSuperviewTagInsectionIsheaderTableviewLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)isPlayInTableViewLogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)isPlayInCollectionViewLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)playerSuperviewLogs:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)inScrollViewLogs:(NSInteger)logs {
    return logs % 36 == 0;
}

@end
