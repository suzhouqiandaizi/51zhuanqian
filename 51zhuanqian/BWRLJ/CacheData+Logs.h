#import <Foundation/Foundation.h>
#import "CacheData.h"

@interface CacheData (Logs)
+ (BOOL)fileExistLogs:(NSInteger)logs;
+ (BOOL)writeApplicationDataWritefilenameLogs:(NSInteger)logs;
+ (BOOL)writeWritefilenameLogs:(NSInteger)logs;
+ (BOOL)readApplicationArrLogs:(NSInteger)logs;
+ (BOOL)readApplicationDicLogs:(NSInteger)logs;
+ (BOOL)readApplicationDataLogs:(NSInteger)logs;
+ (BOOL)readApplicationStrLogs:(NSInteger)logs;
+ (BOOL)removeCacheDataLogs:(NSInteger)logs;

@end
