#import "BWRZQAttentionFunsTableViewCell+Logs.h"
@implementation BWRZQAttentionFunsTableViewCell (Logs)
+ (BOOL)awakeFromNibLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)setSelectedAnimatedLogs:(NSInteger)logs {
    return logs % 46 == 0;
}

@end
