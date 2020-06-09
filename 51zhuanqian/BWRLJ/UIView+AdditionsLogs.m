#import "UIView+AdditionsLogs.h"
@implementation UIView (AdditionsLogs)
+ (BOOL)setKeyboardDistanceFromTextFieldLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)keyboardDistanceFromTextFieldLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)setIgnoreSwitchingByNextPreviousLogs:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)ignoreSwitchingByNextPreviousLogs:(NSInteger)logs {
    return logs % 21 == 0;
}

@end
