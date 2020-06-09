#import "NSObject+SJAsyncLoadLogs.h"
@implementation NSObject (SJAsyncLoadLogs)
+ (BOOL)sj_asyncLoadForkeyLogs:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)sj_asyncLoadForkeyCompletionhandlerLogs:(NSInteger)logs {
    return logs % 38 == 0;
}

@end
