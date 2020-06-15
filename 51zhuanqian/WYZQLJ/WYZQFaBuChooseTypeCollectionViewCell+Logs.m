#import "WYZQFaBuChooseTypeCollectionViewCell+Logs.h"
@implementation WYZQFaBuChooseTypeCollectionViewCell (Logs)
+ (BOOL)awakeFromNibLogs:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)clickPressLogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)initWithFrameLogs:(NSInteger)logs {
    return logs % 2 == 0;
}

@end
