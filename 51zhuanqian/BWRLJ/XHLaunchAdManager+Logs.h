#import <Foundation/Foundation.h>
#import "XHLaunchAdManager.h"
#import "XHLaunchAd.h"
#import "AppDelegate.h"
#import "LoadConfig.h"
#import "LaunchAdModel.h"

@interface XHLaunchAdManager (Logs)
+ (BOOL)shareManagerLogs:(NSInteger)logs;
+ (BOOL)setupXHLaunchAdLogs:(NSInteger)logs;
+ (BOOL)example01Logs:(NSInteger)logs;
+ (BOOL)example03Logs:(NSInteger)logs;
+ (BOOL)batchDownloadImageAndCacheLogs:(NSInteger)logs;
+ (BOOL)batchDownloadVideoAndCacheLogs:(NSInteger)logs;
+ (BOOL)launchAdSubViews_alreadyViewLogs:(NSInteger)logs;
+ (BOOL)launchAdSubViewsLogs:(NSInteger)logs;
+ (BOOL)customSkipViewLogs:(NSInteger)logs;
+ (BOOL)skipActionLogs:(NSInteger)logs;
+ (BOOL)xhLaunchAdCustomskipviewDurationLogs:(NSInteger)logs;
+ (BOOL)xhLaunchAdClickandopenmodelClickpointLogs:(NSInteger)logs;
+ (BOOL)xhLaunchAdImagedownloadfinishImagedataLogs:(NSInteger)logs;
+ (BOOL)xhLaunchAdVideodownloadfinishLogs:(NSInteger)logs;
+ (BOOL)xhLaunchAdVideodownloadprogressTotalCurrentLogs:(NSInteger)logs;
+ (BOOL)xhLaunchAdShowFinishLogs:(NSInteger)logs;

@end
