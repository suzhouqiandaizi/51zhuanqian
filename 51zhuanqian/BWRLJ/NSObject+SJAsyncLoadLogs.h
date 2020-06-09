#import <Foundation/Foundation.h>
#import "NSObject+SJAsyncLoad.h"
#import "SJAsyncLoader.h"
#import <objc/message.h>

@interface NSObject (SJAsyncLoadLogs)
+ (BOOL)sj_asyncLoadForkeyLogs:(NSInteger)logs;
+ (BOOL)sj_asyncLoadForkeyCompletionhandlerLogs:(NSInteger)logs;

@end
