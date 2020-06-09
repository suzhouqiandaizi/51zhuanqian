#import <Foundation/Foundation.h>
#import "SJQueue.h"

@interface SJQueue (Logs)
+ (BOOL)queueLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)enqueueLogs:(NSInteger)logs;
+ (BOOL)dequeueLogs:(NSInteger)logs;
+ (BOOL)emptyLogs:(NSInteger)logs;

@end
