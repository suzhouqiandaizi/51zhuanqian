#import "SJMakeTableView+Logs.h"
@implementation SJMakeTableView (Logs)
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)resultLogs:(NSInteger)logs {
    return logs % 9 == 0;
}

@end
