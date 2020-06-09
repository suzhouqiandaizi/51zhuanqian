#import "UIWindow+IQ_UIWindow_HierarchyLogs.h"
@implementation UIWindow (IQ_UIWindow_HierarchyLogs)
+ (BOOL)topMostWindowControllerLogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)currentViewControllerLogs:(NSInteger)logs {
    return logs % 30 == 0;
}

@end
