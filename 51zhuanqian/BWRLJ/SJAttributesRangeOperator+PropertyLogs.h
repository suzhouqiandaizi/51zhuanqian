#import <UIKit/UIKit.h>
#import "SJAttributesRecorder.h"
#import "SJAttributeWorker.h"
#import <CoreText/CoreText.h>
#import <objc/message.h>
#import "SJAttributesRecorder.h"

@interface SJAttributesRangeOperator (PropertyLogs)
+ (BOOL)(UIFont * _Nonnull))fontLogs:(NSInteger)logs;
+ (BOOL)(UIColor * _Nonnull))textColorLogs:(NSInteger)logs;
+ (BOOL)(double))expansionLogs:(NSInteger)logs;
+ (BOOL)(CGSize, CGFloat, UIColor * _Nonnull))shadowLogs:(NSInteger)logs;
+ (BOOL)(UIColor * _Nonnull))backgroundColorLogs:(NSInteger)logs;
+ (BOOL)(NSUnderlineStyle, UIColor * _Nonnull))underLineLogs:(NSInteger)logs;
+ (BOOL)(NSUnderlineStyle, UIColor * _Nonnull))strikethroughLogs:(NSInteger)logs;
+ (BOOL)(UIColor * _Nonnull, double))strokeLogs:(NSInteger)logs;
+ (BOOL)(double))obliquenessLogs:(NSInteger)logs;
+ (BOOL)(double))letterSpacingLogs:(NSInteger)logs;
+ (BOOL)(double))offsetLogs:(NSInteger)logs;
+ (BOOL)(void))isLinkLogs:(NSInteger)logs;
+ (BOOL)(NSParagraphStyle * _Nonnull))paragraphStyleLogs:(NSInteger)logs;
+ (BOOL)(double))lineSpacingLogs:(NSInteger)logs;
+ (BOOL)(double))paragraphSpacingLogs:(NSInteger)logs;
+ (BOOL)(double))paragraphSpacingBeforeLogs:(NSInteger)logs;
+ (BOOL)(double))firstLineHeadIndentLogs:(NSInteger)logs;
+ (BOOL)(double))headIndentLogs:(NSInteger)logs;
+ (BOOL)(double))tailIndentLogs:(NSInteger)logs;
+ (BOOL)(NSTextAlignment))alignmentLogs:(NSInteger)logs;
+ (BOOL)(NSLineBreakMode))lineBreakModeLogs:(NSInteger)logs;

@end
