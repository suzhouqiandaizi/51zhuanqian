#import "WYZQJiaoyimingxiTableViewCell+Logs.h"
@implementation WYZQJiaoyimingxiTableViewCell (Logs)
+ (BOOL)awakeFromNibLogs:(NSInteger)logs {
    return logs % 23 == 0;
}
+ (BOOL)setSelectedAnimatedLogs:(NSInteger)logs {
    return logs % 43 == 0;
}

@end
