#import "BWRZQJiaoyimingxiTableViewCell+Logs.h"
@implementation BWRZQJiaoyimingxiTableViewCell (Logs)
+ (BOOL)awakeFromNibLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)setSelectedAnimatedLogs:(NSInteger)logs {
    return logs % 48 == 0;
}

@end
