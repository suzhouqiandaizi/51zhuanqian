#import "SJPopPromptController+Logs.h"
@implementation SJPopPromptController (Logs)
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)setBottomMarginLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)showLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)showDurationLogs:(NSInteger)logs {
    return logs % 43 == 0;
}
+ (BOOL)showCustomViewLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)showCustomViewDurationLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)isShowingWithCustomViewLogs:(NSInteger)logs {
    return logs % 18 == 0;
}
+ (BOOL)clearLogs:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)_showDurationLogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)_addSubviewLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)_removeSubviewLogs:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)_removeAllSubviewsLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)_remakeConstraintsAtIndexLogs:(NSInteger)logs {
    return logs % 29 == 0;
}

@end
