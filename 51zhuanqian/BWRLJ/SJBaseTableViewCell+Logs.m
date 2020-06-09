#import "SJBaseTableViewCell+Logs.h"
@implementation SJBaseTableViewCell (Logs)
+ (BOOL)reuseIdentifierLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)registerWithTableViewLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)cellWithTableViewIndexpathLogs:(NSInteger)logs {
    return logs % 41 == 0;
}

@end
