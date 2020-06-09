#import "SJBaseTableViewHeaderFooterView+Logs.h"
@implementation SJBaseTableViewHeaderFooterView (Logs)
+ (BOOL)reuseIdentifierLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)registerWithTableViewLogs:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)reusableViewWithTableViewLogs:(NSInteger)logs {
    return logs % 23 == 0;
}

@end
