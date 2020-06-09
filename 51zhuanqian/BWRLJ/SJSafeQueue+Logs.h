#import <Foundation/Foundation.h>
#import "SJQueue.h"

@interface SJSafeQueue (Logs)
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)enqueueLogs:(NSInteger)logs;
+ (BOOL)dequeueLogs:(NSInteger)logs;
+ (BOOL)emptyLogs:(NSInteger)logs;

@end
