#import <Foundation/Foundation.h>
#import "SJResidentThread.h"

@interface SJResidentThread (Logs)
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)_runLogs:(NSInteger)logs;
+ (BOOL)performBlockLogs:(NSInteger)logs;
+ (BOOL)_performBlockOnResidentThreadLogs:(NSInteger)logs;
+ (BOOL)_stopLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;

@end
