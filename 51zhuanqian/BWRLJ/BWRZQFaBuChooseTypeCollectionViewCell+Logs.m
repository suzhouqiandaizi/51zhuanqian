#import "BWRZQFaBuChooseTypeCollectionViewCell+Logs.h"
@implementation BWRZQFaBuChooseTypeCollectionViewCell (Logs)
+ (BOOL)awakeFromNibLogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)clickPressLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)initWithFrameLogs:(NSInteger)logs {
    return logs % 32 == 0;
}

@end
