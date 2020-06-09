#import "BWRZQTaskReadItemOneTableViewCell+Logs.h"
@implementation BWRZQTaskReadItemOneTableViewCell (Logs)
+ (BOOL)awakeFromNibLogs:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)setSelectedAnimatedLogs:(NSInteger)logs {
    return logs % 34 == 0;
}

@end
