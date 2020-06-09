#import "SJUTAttributes+Logs.h"
@implementation SJUTAttributes (Logs)
+ (BOOL)recorderLogs:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)fontLogs:(NSInteger)logs {
    return logs % 29 == 0;
}
+ (BOOL)textColorLogs:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)alignmentLogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)lineSpacingLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)kernLogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)shadowLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)backgroundColorLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)strokeLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)paragraphStyleLogs:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)lineBreakModeLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)underLineLogs:(NSInteger)logs {
    return logs % 34 == 0;
}
+ (BOOL)strikethroughLogs:(NSInteger)logs {
    return logs % 3 == 0;
}
+ (BOOL)baseLineOffsetLogs:(NSInteger)logs {
    return logs % 49 == 0;
}

@end
