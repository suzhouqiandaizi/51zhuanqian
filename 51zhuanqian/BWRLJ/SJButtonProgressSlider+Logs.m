#import "SJButtonProgressSlider+Logs.h"
@implementation SJButtonProgressSlider (Logs)
+ (BOOL)initWithFrameLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)setLeftTextLogs:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)setRightTextLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)setTitleColorLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)_buttonSetupViewLogs:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)leftBtnLogs:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)rightBtnLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)_createButtonLogs:(NSInteger)logs {
    return logs % 34 == 0;
}

@end
