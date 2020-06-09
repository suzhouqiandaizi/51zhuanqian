#import "SJAppearStateObserver+Logs.h"
@implementation SJAppearStateObserver (Logs)
+ (BOOL)initWithViewControllerLogs:(NSInteger)logs {
    return logs % 10 == 0;
}
+ (BOOL)observeValueForKeyPathOfobjectChangeContextLogs:(NSInteger)logs {
    return logs % 29 == 0;
}

@end
