#import "WYZQBlacklistTableViewCell+Logs.h"
@implementation WYZQBlacklistTableViewCell (Logs)
+ (BOOL)awakeFromNibLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)setSelectedAnimatedLogs:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)cancelPressLogs:(NSInteger)logs {
    return logs % 36 == 0;
}

@end
