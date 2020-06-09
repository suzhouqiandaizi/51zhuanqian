#import "UIColor+HexadecimalLogsLogs.h"
@implementation UIColor (HexadecimalLogsLogs)
+ (BOOL)colorWithHexLogsLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)colorWithHexAlphaLogsLogs:(NSInteger)logs {
    return logs % 33 == 0;
}

@end
