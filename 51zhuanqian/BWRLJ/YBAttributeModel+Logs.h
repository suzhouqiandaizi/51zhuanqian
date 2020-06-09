#import <UIKit/UIKit.h>
#import "UILabel+YBAttributeTextTapAction.h"
#import <objc/runtime.h>
#import <CoreText/CoreText.h>
#import <Foundation/Foundation.h>

@interface YBAttributeModel (Logs)
+ (BOOL)attributeStringsLogs:(NSInteger)logs;
+ (BOOL)setAttributeStringsLogs:(NSInteger)logs;
+ (BOOL)effectDicLogs:(NSInteger)logs;
+ (BOOL)setEffectDicLogs:(NSInteger)logs;
+ (BOOL)isTapActionLogs:(NSInteger)logs;
+ (BOOL)setIsTapActionLogs:(NSInteger)logs;
+ (BOOL)(NSString *, NSRange, NSInteger))tapBlockLogs:(NSInteger)logs;
+ (BOOL)setTapBlockLogs:(NSInteger)logs;
+ (BOOL)delegateLogs:(NSInteger)logs;
+ (BOOL)enabledTapEffectLogs:(NSInteger)logs;
+ (BOOL)setEnabledTapEffectLogs:(NSInteger)logs;
+ (BOOL)isTapEffectLogs:(NSInteger)logs;
+ (BOOL)setIsTapEffectLogs:(NSInteger)logs;
+ (BOOL)setDelegateLogs:(NSInteger)logs;
+ (BOOL)yb_addAttributeTapActionWithStringsTapclickedLogs:(NSInteger)logs;
+ (BOOL)yb_addAttributeTapActionWithStringsDelegateLogs:(NSInteger)logs;
+ (BOOL)touchesBeganWitheventLogs:(NSInteger)logs;
+ (BOOL)hitTestWitheventLogs:(NSInteger)logs;
+ (BOOL)yb_getTapFrameWithTouchPointResultLogs:(NSInteger)logs;
+ (BOOL)touchesEndedWitheventLogs:(NSInteger)logs;
+ (BOOL)touchesCancelledWitheventLogs:(NSInteger)logs;
+ (BOOL)yb_transformForCoreTextLogs:(NSInteger)logs;
+ (BOOL)yb_getLineBoundsPointLogs:(NSInteger)logs;
+ (BOOL)yb_tapEffectWithStatusLogs:(NSInteger)logs;
+ (BOOL)yb_saveEffectDicWithRangeLogs:(NSInteger)logs;
+ (BOOL)yb_getRangesWithStringsLogs:(NSInteger)logs;
+ (BOOL)yb_getStringWithRangeLogs:(NSInteger)logs;

@end
