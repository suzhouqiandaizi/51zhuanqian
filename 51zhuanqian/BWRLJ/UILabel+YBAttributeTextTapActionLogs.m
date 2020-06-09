#import "UILabel+YBAttributeTextTapActionLogs.h"
@implementation UILabel (YBAttributeTextTapActionLogs)
+ (BOOL)attributeStringsLogs:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)setAttributeStringsLogs:(NSInteger)logs {
    return logs % 42 == 0;
}
+ (BOOL)effectDicLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)setEffectDicLogs:(NSInteger)logs {
    return logs % 18 == 0;
}
+ (BOOL)isTapActionLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)setIsTapActionLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)(NSString *, NSRange, NSInteger))tapBlockLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)setTapBlockLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)delegateLogs:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)enabledTapEffectLogs:(NSInteger)logs {
    return logs % 1 == 0;
}
+ (BOOL)setEnabledTapEffectLogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)isTapEffectLogs:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)setIsTapEffectLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)setDelegateLogs:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)yb_addAttributeTapActionWithStringsTapclickedLogs:(NSInteger)logs {
    return logs % 9 == 0;
}
+ (BOOL)yb_addAttributeTapActionWithStringsDelegateLogs:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)touchesBeganWitheventLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)hitTestWitheventLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)yb_getTapFrameWithTouchPointResultLogs:(NSInteger)logs {
    return logs % 26 == 0;
}
+ (BOOL)touchesEndedWitheventLogs:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)touchesCancelledWitheventLogs:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)yb_transformForCoreTextLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)yb_getLineBoundsPointLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)yb_tapEffectWithStatusLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)yb_saveEffectDicWithRangeLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)yb_getRangesWithStringsLogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)yb_getStringWithRangeLogs:(NSInteger)logs {
    return logs % 18 == 0;
}

@end
