#import <Foundation/Foundation.h>
#import "SJTaskQueue.h"
#import <stdlib.h>

@interface SJTaskQueue (Logs)
+ (BOOL)(NSString * _Nonnull))queueLogs:(NSInteger)logs;
+ (BOOL)mainLogs:(NSInteger)logs;
+ (BOOL)(NSString * _Nonnull))destroyLogs:(NSInteger)logs;
+ (BOOL)initWithNameLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)(SJTaskHandler _Nonnull))enqueueLogs:(NSInteger)logs;
+ (BOOL)(void))dequeueLogs:(NSInteger)logs;
+ (BOOL)(NSTimeInterval secs))delayLogs:(NSInteger)logs;
+ (BOOL)(void))emptyLogs:(NSInteger)logs;
+ (BOOL)(void))destroyLogs:(NSInteger)logs;
+ (BOOL)_performNextTaskIfNeededLogs:(NSInteger)logs;
+ (BOOL)_dequeueLogs:(NSInteger)logs;
+ (BOOL)_enqueueLogs:(NSInteger)logs;
+ (BOOL)_emptyLogs:(NSInteger)logs;
+ (BOOL)countLogs:(NSInteger)logs;

@end
