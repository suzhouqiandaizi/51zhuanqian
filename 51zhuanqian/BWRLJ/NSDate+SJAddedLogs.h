#import <Foundation/Foundation.h>
#import "NSDate+SJAdded.h"

@interface NSDate (SJAddedLogs)
+ (BOOL)sj_yyyy_MM_dd_HH_mm_ssLogs:(NSInteger)logs;
+ (BOOL)sj_yyyy_MM_dd_HH_mmLogs:(NSInteger)logs;
+ (BOOL)sj_yyyy_MM_ddLogs:(NSInteger)logs;
+ (BOOL)sj_HH_mm_ssLogs:(NSInteger)logs;
+ (BOOL)sj_yyyyLogs:(NSInteger)logs;
+ (BOOL)sj_MMLogs:(NSInteger)logs;
+ (BOOL)sj_ddLogs:(NSInteger)logs;
+ (BOOL)sj_HHLogs:(NSInteger)logs;
+ (BOOL)sj_mmLogs:(NSInteger)logs;
+ (BOOL)sj_ssLogs:(NSInteger)logs;

@end
