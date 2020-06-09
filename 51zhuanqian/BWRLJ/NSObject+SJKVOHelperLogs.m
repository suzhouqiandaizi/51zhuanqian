#import "NSObject+SJKVOHelperLogs.h"
@implementation NSObject (SJKVOHelperLogs)
+ (BOOL)sj_addObserverForkeypathLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)sj_addObserverForkeypathContextLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)sj_addObserverForkeypathOptionsContextLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)sj_observerhashSetLogs:(NSInteger)logs {
    return logs % 14 == 0;
}

@end
