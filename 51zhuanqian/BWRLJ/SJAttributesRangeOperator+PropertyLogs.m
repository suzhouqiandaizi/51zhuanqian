#import "SJAttributesRangeOperator+PropertyLogs.h"
@implementation SJAttributesRangeOperator (PropertyLogs)
+ (BOOL)(UIFont * _Nonnull))fontLogs:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)(UIColor * _Nonnull))textColorLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)(double))expansionLogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)(CGSize, CGFloat, UIColor * _Nonnull))shadowLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)(UIColor * _Nonnull))backgroundColorLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)(NSUnderlineStyle, UIColor * _Nonnull))underLineLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)(NSUnderlineStyle, UIColor * _Nonnull))strikethroughLogs:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)(UIColor * _Nonnull, double))strokeLogs:(NSInteger)logs {
    return logs % 23 == 0;
}
+ (BOOL)(double))obliquenessLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)(double))letterSpacingLogs:(NSInteger)logs {
    return logs % 15 == 0;
}
+ (BOOL)(double))offsetLogs:(NSInteger)logs {
    return logs % 15 == 0;
}
+ (BOOL)(void))isLinkLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)(NSParagraphStyle * _Nonnull))paragraphStyleLogs:(NSInteger)logs {
    return logs % 44 == 0;
}
+ (BOOL)(double))lineSpacingLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)(double))paragraphSpacingLogs:(NSInteger)logs {
    return logs % 15 == 0;
}
+ (BOOL)(double))paragraphSpacingBeforeLogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)(double))firstLineHeadIndentLogs:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)(double))headIndentLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)(double))tailIndentLogs:(NSInteger)logs {
    return logs % 43 == 0;
}
+ (BOOL)(NSTextAlignment))alignmentLogs:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)(NSLineBreakMode))lineBreakModeLogs:(NSInteger)logs {
    return logs % 6 == 0;
}

@end
