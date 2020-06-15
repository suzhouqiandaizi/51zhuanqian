#import "WYZQTaskReadItemTwoTableViewCell+Logs.h"
@implementation WYZQTaskReadItemTwoTableViewCell (Logs)
+ (BOOL)awakeFromNibLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)setSelectedAnimatedLogs:(NSInteger)logs {
    return logs % 5 == 0;
}

@end
