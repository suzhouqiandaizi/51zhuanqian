#import "SJSubtitleItem+Logs.h"
@implementation SJSubtitleItem (Logs)
+ (BOOL)initWithContentRangeLogs:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)initWithContentStartEndLogs:(NSInteger)logs {
    return logs % 2 == 0;
}

@end
