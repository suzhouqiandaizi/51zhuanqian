#import "NSObject+SJDeallocCallbackLogs.h"
@implementation NSObject (SJDeallocCallbackLogs)
+ (BOOL)sj_addDeallocCallbackTaskLogs:(NSInteger)logs {
    return logs % 14 == 0;
}

@end
