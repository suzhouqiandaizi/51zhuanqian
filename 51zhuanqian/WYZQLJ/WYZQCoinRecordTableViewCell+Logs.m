#import "WYZQCoinRecordTableViewCell+Logs.h"
@implementation WYZQCoinRecordTableViewCell (Logs)
+ (BOOL)awakeFromNibLogs:(NSInteger)logs {
    return logs % 23 == 0;
}
+ (BOOL)setSelectedAnimatedLogs:(NSInteger)logs {
    return logs % 19 == 0;
}

@end
