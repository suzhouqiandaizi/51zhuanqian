#import <Foundation/Foundation.h>
#import "NSObject+SJObserverHelper.h"
#import <objc/message.h>

@interface NSObject (SJKVOHelperLogs)
+ (BOOL)sj_addObserverForkeypathLogs:(NSInteger)logs;
+ (BOOL)sj_addObserverForkeypathContextLogs:(NSInteger)logs;
+ (BOOL)sj_addObserverForkeypathOptionsContextLogs:(NSInteger)logs;
+ (BOOL)sj_observerhashSetLogs:(NSInteger)logs;

@end
