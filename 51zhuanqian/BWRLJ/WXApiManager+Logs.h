#import <Foundation/Foundation.h>
#import "WXApi.h"
#import "WXApiManager.h"

@interface WXApiManager (Logs)
+ (BOOL)sharedManagerLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)onRespLogs:(NSInteger)logs;
+ (BOOL)onReqLogs:(NSInteger)logs;

@end
