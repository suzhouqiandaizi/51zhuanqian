#import "NSAttributedString+SJMakeLogs.h"
@implementation NSAttributedString (SJMakeLogs)
+ (BOOL)sj_UIKitTextLogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)sj_textSizeLogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)sj_textSizeForRangeLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)sj_textSizeForPreferredMaxLayoutWidthLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)sj_textSizeForPreferredMaxLayoutHeightLogs:(NSInteger)logs {
    return logs % 46 == 0;
}

@end
