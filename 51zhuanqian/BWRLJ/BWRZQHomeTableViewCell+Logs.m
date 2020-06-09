#import "BWRZQHomeTableViewCell+Logs.h"
@implementation BWRZQHomeTableViewCell (Logs)
+ (BOOL)awakeFromNibLogs:(NSInteger)logs {
    return logs % 23 == 0;
}
+ (BOOL)setSelectedAnimatedLogs:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)showContentLogs:(NSInteger)logs {
    return logs % 5 == 0;
}

@end
