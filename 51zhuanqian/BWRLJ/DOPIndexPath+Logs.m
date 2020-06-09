#import "DOPIndexPath+Logs.h"
@implementation DOPIndexPath (Logs)
+ (BOOL)initWithColumnRowLogs:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)initWithColumnRowTemLogs:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)indexPathWithColRowLogs:(NSInteger)logs {
    return logs % 23 == 0;
}
+ (BOOL)indexPathWithColRowItemLogs:(NSInteger)logs {
    return logs % 28 == 0;
}

@end
