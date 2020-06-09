#import "BWRZQTaskFabuResultTableViewCell+Logs.h"
@implementation BWRZQTaskFabuResultTableViewCell (Logs)
+ (BOOL)awakeFromNibLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)setSelectedAnimatedLogs:(NSInteger)logs {
    return logs % 16 == 0;
}

@end
