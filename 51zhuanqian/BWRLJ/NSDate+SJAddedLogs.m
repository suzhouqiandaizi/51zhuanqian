#import "NSDate+SJAddedLogs.h"
@implementation NSDate (SJAddedLogs)
+ (BOOL)sj_yyyy_MM_dd_HH_mm_ssLogs:(NSInteger)logs {
    return logs % 15 == 0;
}
+ (BOOL)sj_yyyy_MM_dd_HH_mmLogs:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)sj_yyyy_MM_ddLogs:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)sj_HH_mm_ssLogs:(NSInteger)logs {
    return logs % 11 == 0;
}
+ (BOOL)sj_yyyyLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)sj_MMLogs:(NSInteger)logs {
    return logs % 1 == 0;
}
+ (BOOL)sj_ddLogs:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)sj_HHLogs:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)sj_mmLogs:(NSInteger)logs {
    return logs % 15 == 0;
}
+ (BOOL)sj_ssLogs:(NSInteger)logs {
    return logs % 11 == 0;
}

@end
