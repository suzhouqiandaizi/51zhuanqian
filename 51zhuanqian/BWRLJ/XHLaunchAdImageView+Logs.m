#import "XHLaunchAdImageView+Logs.h"
@implementation XHLaunchAdImageView (Logs)
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)tapLogs:(NSInteger)logs {
    return logs % 24 == 0;
}

@end
