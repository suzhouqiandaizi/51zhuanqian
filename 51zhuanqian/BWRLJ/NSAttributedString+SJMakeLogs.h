#import <Foundation/Foundation.h>
#import "SJUIKitAttributesDefines.h"
#import "NSAttributedString+SJMake.h"
#import "SJUIKitTextMaker.h"

@interface NSAttributedString (SJMakeLogs)
+ (BOOL)sj_UIKitTextLogs:(NSInteger)logs;
+ (BOOL)sj_textSizeLogs:(NSInteger)logs;
+ (BOOL)sj_textSizeForRangeLogs:(NSInteger)logs;
+ (BOOL)sj_textSizeForPreferredMaxLayoutWidthLogs:(NSInteger)logs;
+ (BOOL)sj_textSizeForPreferredMaxLayoutHeightLogs:(NSInteger)logs;

@end
