#import "SJUICollectionViewCellPlayModel+Logs.h"
@implementation SJUICollectionViewCellPlayModel (Logs)
+ (BOOL)initWithPlayerSuperviewAtindexpathCollectionviewLogs:(NSInteger)logs {
    return logs % 26 == 0;
}
+ (BOOL)initWithPlayerSuperviewTagAtindexpathCollectionviewLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)isPlayInTableViewLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)isPlayInCollectionViewLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)playerSuperviewLogs:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)inScrollViewLogs:(NSInteger)logs {
    return logs % 13 == 0;
}

@end
