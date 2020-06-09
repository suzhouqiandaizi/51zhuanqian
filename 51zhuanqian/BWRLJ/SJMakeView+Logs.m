#import "SJMakeView+Logs.h"
@implementation SJMakeView (Logs)
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)resultLogs:(NSInteger)logs {
    return logs % 10 == 0;
}
+ (BOOL)installLogs:(NSInteger)logs {
    return logs % 10 == 0;
}

@end
