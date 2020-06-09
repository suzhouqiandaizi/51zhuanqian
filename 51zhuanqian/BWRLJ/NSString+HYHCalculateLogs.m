#import "NSString+HYHCalculateLogs.h"
@implementation NSString (HYHCalculateLogs)
+ (BOOL)calculateMaxWidthWithHeightAttributesLogs:(NSInteger)logs {
    return logs % 43 == 0;
}
+ (BOOL)calculateMaxHeightWithWidthAttributesLogs:(NSInteger)logs {
    return logs % 17 == 0;
}

@end
