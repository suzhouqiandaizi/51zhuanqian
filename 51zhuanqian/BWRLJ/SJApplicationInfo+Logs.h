#import <UIKit/UIKit.h>
#import "SJApplicationInfo.h"
#import "NSDate+SJAdded.h"
#import <sys/utsname.h>

@interface SJApplicationInfo (Logs)
+ (BOOL)sharedLogs:(NSInteger)logs;
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)isFirstLaunchedAtTodayLogs:(NSInteger)logs;
+ (BOOL)_update_isFirstLaunchedAtTodayStateLogs:(NSInteger)logs;
+ (BOOL)topViewControllerLogs:(NSInteger)logs;
+ (BOOL)machineModelLogs:(NSInteger)logs;
+ (BOOL)versionLogs:(NSInteger)logs;
+ (BOOL)systemVersionLogs:(NSInteger)logs;
+ (BOOL)_iPhonePlatformLogs:(NSInteger)logs;
+ (BOOL)_iPadPlatformLogs:(NSInteger)logs;
+ (BOOL)_iPodPlatformLogs:(NSInteger)logs;

@end
