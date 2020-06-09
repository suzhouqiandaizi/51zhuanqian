#import "MKAnnotationView+WebCacheLogs.h"
@implementation MKAnnotationView (WebCacheLogs)
+ (BOOL)sd_setImageWithURLLogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)sd_setImageWithURLPlaceholderimageLogs:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)sd_setImageWithURLPlaceholderimageOptionsLogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)sd_setImageWithURLCompletedLogs:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)sd_setImageWithURLPlaceholderimageCompletedLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)sd_setImageWithURLPlaceholderimageOptionsCompletedLogs:(NSInteger)logs {
    return logs % 22 == 0;
}

@end
