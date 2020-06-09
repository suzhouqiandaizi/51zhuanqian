#import <Foundation/Foundation.h>
#import "SJObjectContainer.h"

@interface SJObjectContainer (Logs)
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)countLogs:(NSInteger)logs;
+ (BOOL)addFlagLogs:(NSInteger)logs;
+ (BOOL)removeFlagLogs:(NSInteger)logs;
+ (BOOL)objectForFlagLogs:(NSInteger)logs;
+ (BOOL)objectAtIndexLogs:(NSInteger)logs;
+ (BOOL)flagOfObjectAtIndexLogs:(NSInteger)logs;
+ (BOOL)indexForFlagLogs:(NSInteger)logs;
+ (BOOL)indexOfObjectLogs:(NSInteger)logs;
+ (BOOL)removeAllObjectsLogs:(NSInteger)logs;

@end
