#import "WYZQTaskClassifyTableViewCell+Logs.h"
@implementation WYZQTaskClassifyTableViewCell (Logs)
+ (BOOL)awakeFromNibLogs:(NSInteger)logs {
    return logs % 9 == 0;
}
+ (BOOL)setSelectedAnimatedLogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)clickPressLogs:(NSInteger)logs {
    return logs % 36 == 0;
}

@end
