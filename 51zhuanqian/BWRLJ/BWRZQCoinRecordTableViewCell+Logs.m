#import "BWRZQCoinRecordTableViewCell+Logs.h"
@implementation BWRZQCoinRecordTableViewCell (Logs)
+ (BOOL)awakeFromNibLogs:(NSInteger)logs {
    return logs % 11 == 0;
}
+ (BOOL)setSelectedAnimatedLogs:(NSInteger)logs {
    return logs % 2 == 0;
}

@end
