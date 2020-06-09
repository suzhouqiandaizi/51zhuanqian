#import <UIKit/UIKit.h>
#import "SJFloatSmallViewControllerDefines.h"
#import "SJFloatSmallViewController.h"
#import <SJUIKit/NSObject+SJObserverHelper.h>
#import "NSObject+SJObserverHelper.h"

@interface SJFloatSmallViewController (Logs)
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)floatViewLogs:(NSInteger)logs;
+ (BOOL)showFloatViewLogs:(NSInteger)logs;
+ (BOOL)dismissFloatViewLogs:(NSInteger)logs;
+ (BOOL)getObserverLogs:(NSInteger)logs;
+ (BOOL)atViewControllerLogs:(NSInteger)logs;
+ (BOOL)_addGesturesToFloatViewLogs:(NSInteger)logs;
+ (BOOL)setSlidableLogs:(NSInteger)logs;
+ (BOOL)slidableLogs:(NSInteger)logs;
+ (BOOL)panGestureLogs:(NSInteger)logs;
+ (BOOL)_handlePanGestureLogs:(NSInteger)logs;

@end
