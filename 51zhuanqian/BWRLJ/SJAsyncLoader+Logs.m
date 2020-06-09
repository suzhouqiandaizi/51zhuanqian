#import "SJAsyncLoader+Logs.h"
@implementation SJAsyncLoader (Logs)
+ (BOOL)asyncLoadWithBlockCompletionhandlerLogs:(NSInteger)logs {
    return logs % 46 == 0;
}

@end
