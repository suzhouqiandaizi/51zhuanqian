#import "WYZQAttentionFunsTableViewCell+Logs.h"
@implementation WYZQAttentionFunsTableViewCell (Logs)
+ (BOOL)awakeFromNibLogs:(NSInteger)logs {
    return logs % 11 == 0;
}
+ (BOOL)setSelectedAnimatedLogs:(NSInteger)logs {
    return logs % 16 == 0;
}

@end
