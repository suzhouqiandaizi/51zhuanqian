#import "UIImageView+extensionLogs.h"
@implementation UIImageView (extensionLogs)
+ (BOOL)addGestureRecognizerHandlePersonDetailLogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)setPersonIdLogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)handleToPersonDetailLogs:(NSInteger)logs {
    return logs % 7 == 0;
}

@end
