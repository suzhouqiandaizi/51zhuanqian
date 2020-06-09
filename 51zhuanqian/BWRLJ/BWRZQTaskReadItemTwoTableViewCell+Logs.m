#import "BWRZQTaskReadItemTwoTableViewCell+Logs.h"
@implementation BWRZQTaskReadItemTwoTableViewCell (Logs)
+ (BOOL)awakeFromNibLogs:(NSInteger)logs {
    return logs % 11 == 0;
}
+ (BOOL)setSelectedAnimatedLogs:(NSInteger)logs {
    return logs % 32 == 0;
}

@end
