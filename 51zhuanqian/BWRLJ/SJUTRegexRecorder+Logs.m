#import "SJUTRegexRecorder+Logs.h"
@implementation SJUTRegexRecorder (Logs)
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 20 == 0;
}

@end
