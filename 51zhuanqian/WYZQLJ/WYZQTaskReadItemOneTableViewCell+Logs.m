#import "WYZQTaskReadItemOneTableViewCell+Logs.h"
@implementation WYZQTaskReadItemOneTableViewCell (Logs)
+ (BOOL)awakeFromNibLogs:(NSInteger)logs {
    return logs % 44 == 0;
}
+ (BOOL)setSelectedAnimatedLogs:(NSInteger)logs {
    return logs % 29 == 0;
}

@end
