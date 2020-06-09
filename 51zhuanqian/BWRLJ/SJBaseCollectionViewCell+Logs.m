#import "SJBaseCollectionViewCell+Logs.h"
@implementation SJBaseCollectionViewCell (Logs)
+ (BOOL)reuseIdentifierLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)registerWithCollectionViewLogs:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)cellWithCollectionViewIndexpathLogs:(NSInteger)logs {
    return logs % 19 == 0;
}

@end
