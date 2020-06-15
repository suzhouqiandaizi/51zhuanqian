#import "WYZQFaBuOneCollectionViewCell+Logs.h"
@implementation WYZQFaBuOneCollectionViewCell (Logs)
+ (BOOL)awakeFromNibLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)initWithFrameLogs:(NSInteger)logs {
    return logs % 5 == 0;
}

@end
