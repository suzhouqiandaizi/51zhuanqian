#import "SJMakeScrollView+Logs.h"
@implementation SJMakeScrollView (Logs)
+ (BOOL)resultLogs:(NSInteger)logs {
    return logs % 46 == 0;
}

@end
