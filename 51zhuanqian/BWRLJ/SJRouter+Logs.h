#import <Foundation/Foundation.h>
#import "SJRouteHandler.h"
#import "SJRouter.h"
#import <objc/message.h>

@interface SJRouter (Logs)
+ (BOOL)sharedLogs:(NSInteger)logs;
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)handleRequestCompletionhandlerLogs:(NSInteger)logs;
+ (BOOL)canHandleRoutePathLogs:(NSInteger)logs;

@end
