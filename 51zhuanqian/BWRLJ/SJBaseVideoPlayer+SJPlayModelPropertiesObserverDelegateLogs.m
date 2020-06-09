#import "SJBaseVideoPlayer+SJPlayModelPropertiesObserverDelegateLogs.h"
@implementation SJBaseVideoPlayer (SJPlayModelPropertiesObserverDelegateLogs)
+ (BOOL)observerUsertouchedcollectionviewLogs:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)observerUsertouchedtableviewLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)playerWillAppearForObserverSuperviewLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)playerWillDisappearForObserverLogs:(NSInteger)logs {
    return logs % 28 == 0;
}

@end
