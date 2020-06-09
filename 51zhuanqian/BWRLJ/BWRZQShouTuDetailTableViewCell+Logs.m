#import "BWRZQShouTuDetailTableViewCell+Logs.h"
@implementation BWRZQShouTuDetailTableViewCell (Logs)
+ (BOOL)awakeFromNibLogs:(NSInteger)logs {
    return logs % 42 == 0;
}
+ (BOOL)setSelectedAnimatedLogs:(NSInteger)logs {
    return logs % 39 == 0;
}

@end
