#import "XHLaunchImageView+Logs.h"
@implementation XHLaunchImageView (Logs)
+ (BOOL)initWithSourceTypeLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)imageFromLaunchImageLogs:(NSInteger)logs {
    return logs % 10 == 0;
}
+ (BOOL)imageFromLaunchScreenLogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)imageFromViewLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)launchImageWithTypeLogs:(NSInteger)logs {
    return logs % 41 == 0;
}

@end
