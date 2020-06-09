#import "UIColor+HexadecimalLogs.h"
@implementation UIColor (HexadecimalLogs)
+ (BOOL)colorWithHexLogs:(NSInteger)logs {
    return logs % 9 == 0;
}
+ (BOOL)colorWithHexAlphaLogs:(NSInteger)logs {
    return logs % 25 == 0;
}

@end
