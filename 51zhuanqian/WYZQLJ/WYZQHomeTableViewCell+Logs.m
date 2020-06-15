#import "WYZQHomeTableViewCell+Logs.h"
@implementation WYZQHomeTableViewCell (Logs)
+ (BOOL)awakeFromNibLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)setSelectedAnimatedLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)showContentLogs:(NSInteger)logs {
    return logs % 6 == 0;
}

@end
