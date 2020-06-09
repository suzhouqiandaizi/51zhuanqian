#import <Foundation/Foundation.h>
#import "SJRunLoopTaskQueue.h"
#import <stdlib.h>

@interface SJRunLoopTaskQueue (Logs)
+ (BOOL)(NSString * _Nonnull))queueLogs:(NSInteger)logs;
+ (BOOL)mainLogs:(NSInteger)logs;
+ (BOOL)(NSString * _Nonnull))destroyLogs:(NSInteger)logs;
+ (BOOL)initWithNameRunloopModeLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)(CFRunLoopRef _Nonnull, CFRunLoopMode _Nonnull))updateLogs:(NSInteger)logs;
+ (BOOL)(SJRunLoopTaskHandler _Nonnull))enqueueLogs:(NSInteger)logs;
+ (BOOL)(void))dequeueLogs:(NSInteger)logs;
+ (BOOL)(NSUInteger))delayLogs:(NSInteger)logs;
+ (BOOL)(void))emptyLogs:(NSInteger)logs;
+ (BOOL)(void))destroyLogs:(NSInteger)logs;
+ (BOOL)_performTaskLogs:(NSInteger)logs;
+ (BOOL)_addRunLoopObserverIfNeededLogs:(NSInteger)logs;
+ (BOOL)_removeRunLoopObserverLogs:(NSInteger)logs;
+ (BOOL)_updateObserverRunLoopModeLogs:(NSInteger)logs;
+ (BOOL)_dequeueLogs:(NSInteger)logs;
+ (BOOL)_enqueueLogs:(NSInteger)logs;
+ (BOOL)_emptyLogs:(NSInteger)logs;
+ (BOOL)countLogs:(NSInteger)logs;

@end
