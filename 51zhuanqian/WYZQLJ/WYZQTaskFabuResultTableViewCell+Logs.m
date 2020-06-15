#import "WYZQTaskFabuResultTableViewCell+Logs.h"
@implementation WYZQTaskFabuResultTableViewCell (Logs)
+ (BOOL)awakeFromNibLogs:(NSInteger)logs {
    return logs % 42 == 0;
}
+ (BOOL)setSelectedAnimatedLogs:(NSInteger)logs {
    return logs % 30 == 0;
}

@end
