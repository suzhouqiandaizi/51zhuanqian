#import "BWRZQMessageTableViewCell+Logs.h"
@implementation BWRZQMessageTableViewCell (Logs)
+ (BOOL)awakeFromNibLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)setSelectedAnimatedLogs:(NSInteger)logs {
    return logs % 19 == 0;
}

@end
