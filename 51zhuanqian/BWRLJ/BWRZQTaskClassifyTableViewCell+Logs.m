#import "BWRZQTaskClassifyTableViewCell+Logs.h"
@implementation BWRZQTaskClassifyTableViewCell (Logs)
+ (BOOL)awakeFromNibLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)setSelectedAnimatedLogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)clickPressLogs:(NSInteger)logs {
    return logs % 24 == 0;
}

@end
