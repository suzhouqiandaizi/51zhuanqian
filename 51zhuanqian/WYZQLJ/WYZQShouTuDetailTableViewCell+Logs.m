#import "WYZQShouTuDetailTableViewCell+Logs.h"
@implementation WYZQShouTuDetailTableViewCell (Logs)
+ (BOOL)awakeFromNibLogs:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)setSelectedAnimatedLogs:(NSInteger)logs {
    return logs % 39 == 0;
}

@end
