#import "SJUTAttributes.h"
#import "SJUIKitTextMaker.h"
#import "SJUTRegexHandler.h"
#import "SJUTRangeHandler.h"

@interface SJUIKitTextMaker (Logs)
+ (BOOL)utsLogs:(NSInteger)logs;
+ (BOOL)updatesLogs:(NSInteger)logs;
+ (BOOL)regexsLogs:(NSInteger)logs;
+ (BOOL)rangesLogs:(NSInteger)logs;
+ (BOOL)(NSString * _Nonnull))appendLogs:(NSInteger)logs;
+ (BOOL)(NSRange))updateLogs:(NSInteger)logs;
+ (BOOL)(void (^ _Nonnull)(id<SJUTImageAttachment> _Nonnull)))appendImageLogs:(NSInteger)logs;
+ (BOOL)(NSAttributedString * _Nonnull))appendTextLogs:(NSInteger)logs;
+ (BOOL)(NSString * _Nonnull))regexLogs:(NSInteger)logs;
+ (BOOL)(NSRange))rangeLogs:(NSInteger)logs;
+ (BOOL)installLogs:(NSInteger)logs;
+ (BOOL)_appendUTAttributesToResultIfNeededLogs:(NSInteger)logs;
+ (BOOL)_convertToUIKitTextForUTAttributesLogs:(NSInteger)logs;
+ (BOOL)_executeRangeHandlersIfNeededLogs:(NSInteger)logs;
+ (BOOL)_executeRegexHandlersIfNeededLogs:(NSInteger)logs;
+ (BOOL)_executeReplaceWithStringUtInrangeLogs:(NSInteger)logs;
+ (BOOL)_executeReplaceWithTextHandlerInrangeLogs:(NSInteger)logs;
+ (BOOL)_executeUpdateHandlersIfNeededLogs:(NSInteger)logs;
+ (BOOL)_appendUpdateHandlerToUpdatesInrangeLogs:(NSInteger)logs;
+ (BOOL)_setSubtextCommonValuesToRecorderInrangeResultLogs:(NSInteger)logs;
+ (BOOL)_setCommonValuesForUTAttributesRecorderIfNeededLogs:(NSInteger)logs;
+ (BOOL)_convertToUIKitTextAttributesForUTAttributesRecorderLogs:(NSInteger)logs;
+ (BOOL)_adjustVerticalOffsetOfImageAttachmentForBoundsImagesizeAlignmentCommonfontLogs:(NSInteger)logs;

@end
