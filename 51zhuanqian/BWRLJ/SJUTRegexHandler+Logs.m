#import "SJUTRegexHandler+Logs.h"
@implementation SJUTRegexHandler (Logs)
+ (BOOL)initWithRegexLogs:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)(void (^ _Nonnull)(NSMutableAttributedString *attrStr, NSTextCheckingResult * _Nonnull)))handlerLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)(void (^ _Nonnull)(id<SJUIKitTextMakerProtocol> _Nonnull)))replaceWithTextLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)(NSString * _Nonnull))replaceWithStringLogs:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)(void (^ _Nonnull)(id<SJUTAttributesProtocol> _Nonnull)))updateLogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)(NSMatchingOptions))matchingOptionsLogs:(NSInteger)logs {
    return logs % 44 == 0;
}
+ (BOOL)(NSRegularExpressionOptions))regularExpressionOptionsLogs:(NSInteger)logs {
    return logs % 28 == 0;
}

@end
