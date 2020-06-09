#import "SJUITableViewCellPlayModel+Logs.h"
@implementation SJUITableViewCellPlayModel (Logs)
+ (BOOL)initWithPlayerSuperviewAtindexpathTableviewLogs:(NSInteger)logs {
    return logs % 44 == 0;
}
+ (BOOL)initWithPlayerSuperviewTagAtindexpathTableviewLogs:(NSInteger)logs {
    return logs % 43 == 0;
}
+ (BOOL)isPlayInTableViewLogs:(NSInteger)logs {
    return logs % 18 == 0;
}
+ (BOOL)isPlayInCollectionViewLogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)playerSuperviewLogs:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)inScrollViewLogs:(NSInteger)logs {
    return logs % 34 == 0;
}

@end
