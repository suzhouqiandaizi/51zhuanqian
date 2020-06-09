#import <Foundation/Foundation.h>
#import "SJUIKitAttributesDefines.h"
#import "SJUTRecorder.h"
#import "SJUTAttributes.h"

@interface SJUTAttributes (Logs)
+ (BOOL)recorderLogs:(NSInteger)logs;
+ (BOOL)fontLogs:(NSInteger)logs;
+ (BOOL)textColorLogs:(NSInteger)logs;
+ (BOOL)alignmentLogs:(NSInteger)logs;
+ (BOOL)lineSpacingLogs:(NSInteger)logs;
+ (BOOL)kernLogs:(NSInteger)logs;
+ (BOOL)shadowLogs:(NSInteger)logs;
+ (BOOL)backgroundColorLogs:(NSInteger)logs;
+ (BOOL)strokeLogs:(NSInteger)logs;
+ (BOOL)paragraphStyleLogs:(NSInteger)logs;
+ (BOOL)lineBreakModeLogs:(NSInteger)logs;
+ (BOOL)underLineLogs:(NSInteger)logs;
+ (BOOL)strikethroughLogs:(NSInteger)logs;
+ (BOOL)baseLineOffsetLogs:(NSInteger)logs;

@end
