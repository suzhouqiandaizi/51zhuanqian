#import <Foundation/Foundation.h>
#import "NSObject+SJObserverHelper.h"
#import <objc/message.h>

@interface NSObject (SJNotificationHelperLogs)
+ (BOOL)sj_observeWithNotificationTargetUsingblockLogs:(NSInteger)logs;
+ (BOOL)sj_observeWithNotificationTargetQueueUsingblockLogs:(NSInteger)logs;

@end
