#import "logsNSDateR.h"
@implementation logsNSDateR
+ (BOOL)Ssj_yyyy_MM_dd_HH_mm_ss:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)wsj_yyyy_MM_dd_HH_mm:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)Usj_yyyy_MM_dd:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)ssj_HH_mm_ss:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)jsj_yyyy:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)vsj_MM:(NSInteger)logs {
    return logs % 26 == 0;
}
+ (BOOL)Gsj_dd:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)vsj_HH:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)Lsj_mm:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)Vsj_ss:(NSInteger)logs {
    return logs % 29 == 0;
}

@end
