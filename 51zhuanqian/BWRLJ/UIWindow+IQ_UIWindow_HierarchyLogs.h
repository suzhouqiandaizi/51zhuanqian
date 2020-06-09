#import <UIKit/UIWindow.h>
#import "IQUIWindow+Hierarchy.h"
#import <UIKit/UINavigationController.h>

@interface UIWindow (IQ_UIWindow_HierarchyLogs)
+ (BOOL)topMostWindowControllerLogs:(NSInteger)logs;
+ (BOOL)currentViewControllerLogs:(NSInteger)logs;

@end
