#import "NSObject+SJNotificationHelperLogs.h"
@implementation NSObject (SJNotificationHelperLogs)
+ (BOOL)sj_observeWithNotificationTargetUsingblockLogs:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)sj_observeWithNotificationTargetQueueUsingblockLogs:(NSInteger)logs {
    return logs % 44 == 0;
}

@end
