#import "logsBWRZQTaskButtone+Logs.h"
@implementation logsBWRZQTaskButtone (Logs)
+ (BOOL)bDrawrectLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)DSettaskbuttonLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)PSettaskbuttontitleAWithstatusLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)uSettaskdoingbuttontitleQWithstatusLogs:(NSInteger)logs {
    return logs % 31 == 0;
}

@end
