#import "BWRZQFaBuOneCollectionViewCell+Logs.h"
@implementation BWRZQFaBuOneCollectionViewCell (Logs)
+ (BOOL)awakeFromNibLogs:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)initWithFrameLogs:(NSInteger)logs {
    return logs % 25 == 0;
}

@end
