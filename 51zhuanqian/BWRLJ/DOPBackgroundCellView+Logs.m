#import "DOPBackgroundCellView+Logs.h"
@implementation DOPBackgroundCellView (Logs)
+ (BOOL)drawRectLogs:(NSInteger)logs {
    return logs % 49 == 0;
}

@end
