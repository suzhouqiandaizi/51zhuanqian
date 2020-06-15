#import "WYZQMessageTableViewCell+Logs.h"
@implementation WYZQMessageTableViewCell (Logs)
+ (BOOL)awakeFromNibLogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)setSelectedAnimatedLogs:(NSInteger)logs {
    return logs % 20 == 0;
}

@end
