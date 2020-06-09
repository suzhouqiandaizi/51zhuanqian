#import "SJUICollectionViewNestedInUITableViewHeaderViewPlayModel+Logs.h"
@implementation SJUICollectionViewNestedInUITableViewHeaderViewPlayModel (Logs)
+ (BOOL)initWithPlayerSuperviewAtindexpathCollectionviewTableviewLogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)initWithPlayerSuperviewTagAtindexpathCollectionviewTableviewLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)isPlayInTableViewLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)isPlayInCollectionViewLogs:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)playerSuperviewLogs:(NSInteger)logs {
    return logs % 1 == 0;
}
+ (BOOL)inScrollViewLogs:(NSInteger)logs {
    return logs % 45 == 0;
}

@end
