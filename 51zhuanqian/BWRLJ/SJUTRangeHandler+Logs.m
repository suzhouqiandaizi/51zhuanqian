#import "SJUTRangeHandler+Logs.h"
@implementation SJUTRangeHandler (Logs)
+ (BOOL)initWithRangeLogs:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)(void (^ _Nonnull)(id<SJUIKitTextMakerProtocol> _Nonnull)))replaceWithTextLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)(NSString * _Nonnull))replaceWithStringLogs:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)(void (^ _Nonnull)(id<SJUTAttributesProtocol> _Nonnull)))updateLogs:(NSInteger)logs {
    return logs % 4 == 0;
}

@end
