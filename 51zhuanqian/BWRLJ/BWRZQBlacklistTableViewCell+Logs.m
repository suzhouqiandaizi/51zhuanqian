#import "BWRZQBlacklistTableViewCell+Logs.h"
@implementation BWRZQBlacklistTableViewCell (Logs)
+ (BOOL)awakeFromNibLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)setSelectedAnimatedLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)cancelPressLogs:(NSInteger)logs {
    return logs % 1 == 0;
}

@end
