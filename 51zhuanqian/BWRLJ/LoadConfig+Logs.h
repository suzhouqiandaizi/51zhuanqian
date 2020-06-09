#import <Foundation/Foundation.h>
#import "LoadConfig.h"
#import "CacheData.h"
#import "AppDelegate.h"

@interface LoadConfig (Logs)
+ (BOOL)shareStanceLogs:(NSInteger)logs;
+ (BOOL)loadConfigSuccessFailureLogs:(NSInteger)logs;
+ (BOOL)getConfigLogs:(NSInteger)logs;
+ (BOOL)getTaskHomeCategoryLogs:(NSInteger)logs;
+ (BOOL)getTaskOptioinsLogs:(NSInteger)logs;
+ (BOOL)getTaskClassifyLogs:(NSInteger)logs;
+ (BOOL)loadAboutSuccessLogs:(NSInteger)logs;
+ (BOOL)getAboutLogs:(NSInteger)logs;
+ (BOOL)loadAccountSuccessLogs:(NSInteger)logs;
+ (BOOL)getAccountLogs:(NSInteger)logs;
+ (BOOL)exitAppLogs:(NSInteger)logs;

@end
