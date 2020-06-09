#import <Foundation/Foundation.h>
#import "NSObject+SJObserverHelper.h"
#import <objc/message.h>

@interface NSObject (SJDeallocCallbackLogs)
+ (BOOL)sj_addDeallocCallbackTaskLogs:(NSInteger)logs;

@end
