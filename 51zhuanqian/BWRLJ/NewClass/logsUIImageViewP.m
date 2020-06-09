#import "logsUIImageViewP.h"
@implementation logsUIImageViewP
+ (BOOL)SaddGestureRecognizerHandlePersonDetail:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)lSetpersonid:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)bhandleToPersonDetail:(NSInteger)logs {
    return logs % 3 == 0;
}

@end
