#import "logsBWRZQTaskReadItemOneTableViewCells+Logs.h"
@implementation logsBWRZQTaskReadItemOneTableViewCells (Logs)
+ (BOOL)bawakeFromNibLogs:(NSInteger)logs {
    return logs % 18 == 0;
}
+ (BOOL)ISetselecteddAnimatedLogs:(NSInteger)logs {
    return logs % 19 == 0;
}

@end
