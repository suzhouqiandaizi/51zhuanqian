#import <UIKit/UIKit.h>
#import "SJAttributesRecorder.h"
#import <objc/message.h>

@interface SJAttributesRecorder (Logs)
+ (BOOL)setFontLogs:(NSInteger)logs;
+ (BOOL)setTextColorLogs:(NSInteger)logs;
+ (BOOL)setExpansionLogs:(NSInteger)logs;
+ (BOOL)setShadowLogs:(NSInteger)logs;
+ (BOOL)setBackgroundColorLogs:(NSInteger)logs;
+ (BOOL)setUnderLineLogs:(NSInteger)logs;
+ (BOOL)setStrikethroughLogs:(NSInteger)logs;
+ (BOOL)setStrokeLogs:(NSInteger)logs;
+ (BOOL)setObliquenessLogs:(NSInteger)logs;
+ (BOOL)setLetterSpacingLogs:(NSInteger)logs;
+ (BOOL)setOffsetLogs:(NSInteger)logs;
+ (BOOL)setLinkLogs:(NSInteger)logs;
+ (BOOL)setParagraphStyleMLogs:(NSInteger)logs;
+ (BOOL)paragraphStyleMLogs:(NSInteger)logs;
+ (BOOL)setLineSpacingLogs:(NSInteger)logs;
+ (BOOL)lineSpacingLogs:(NSInteger)logs;
+ (BOOL)setParagraphSpacingLogs:(NSInteger)logs;
+ (BOOL)paragraphSpacingLogs:(NSInteger)logs;
+ (BOOL)setParagraphSpacingBeforeLogs:(NSInteger)logs;
+ (BOOL)paragraphSpacingBeforeLogs:(NSInteger)logs;
+ (BOOL)setFirstLineHeadIndentLogs:(NSInteger)logs;
+ (BOOL)firstLineHeadIndentLogs:(NSInteger)logs;
+ (BOOL)setHeadIndentLogs:(NSInteger)logs;
+ (BOOL)headIndentLogs:(NSInteger)logs;
+ (BOOL)setTailIndentLogs:(NSInteger)logs;
+ (BOOL)tailIndentLogs:(NSInteger)logs;
+ (BOOL)setAlignmentLogs:(NSInteger)logs;
+ (BOOL)setLineBreakModeLogs:(NSInteger)logs;
+ (BOOL)lineBreakModeLogs:(NSInteger)logs;
+ (BOOL)mutableCopyWithZoneLogs:(NSInteger)logs;

@end
