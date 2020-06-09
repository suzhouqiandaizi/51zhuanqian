#import "SJUIKitAttributesDefines.h"
#import "SJUTRegexHandler.h"
#import "SJUTAttributes.h"

@interface SJUTRegexHandler (Logs)
+ (BOOL)initWithRegexLogs:(NSInteger)logs;
+ (BOOL)(void (^ _Nonnull)(NSMutableAttributedString *attrStr, NSTextCheckingResult * _Nonnull)))handlerLogs:(NSInteger)logs;
+ (BOOL)(void (^ _Nonnull)(id<SJUIKitTextMakerProtocol> _Nonnull)))replaceWithTextLogs:(NSInteger)logs;
+ (BOOL)(NSString * _Nonnull))replaceWithStringLogs:(NSInteger)logs;
+ (BOOL)(void (^ _Nonnull)(id<SJUTAttributesProtocol> _Nonnull)))updateLogs:(NSInteger)logs;
+ (BOOL)(NSMatchingOptions))matchingOptionsLogs:(NSInteger)logs;
+ (BOOL)(NSRegularExpressionOptions))regularExpressionOptionsLogs:(NSInteger)logs;

@end
