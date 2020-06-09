#import "SJBaseCollectionReusableView+Logs.h"
@implementation SJBaseCollectionReusableView (Logs)
+ (BOOL)reuseIdentifierLogs:(NSInteger)logs {
    return logs % 3 == 0;
}
+ (BOOL)registerWithCollectionViewLogs:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)reusableViewWithCollectionViewIndexpathLogs:(NSInteger)logs {
    return logs % 41 == 0;
}

@end
