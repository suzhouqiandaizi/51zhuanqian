#import "UIImageView+HighlightedWebCacheLogs.h"
@implementation UIImageView (HighlightedWebCacheLogs)
+ (BOOL)sd_setHighlightedImageWithURLLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)sd_setHighlightedImageWithURLOptionsLogs:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)sd_setHighlightedImageWithURLCompletedLogs:(NSInteger)logs {
    return logs % 26 == 0;
}
+ (BOOL)sd_setHighlightedImageWithURLOptionsCompletedLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)sd_setHighlightedImageWithURLOptionsProgressCompletedLogs:(NSInteger)logs {
    return logs % 34 == 0;
}

@end
