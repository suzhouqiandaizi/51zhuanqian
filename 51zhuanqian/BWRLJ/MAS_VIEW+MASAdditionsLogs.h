#import "MASUtilities.h"
#import "MASConstraintMaker.h"
#import "MASViewAttribute.h"
#import "View+MASAdditions.h"
#import <objc/runtime.h>

@interface MAS_VIEW (MASAdditionsLogs)
+ (BOOL)mas_makeConstraintsLogs:(NSInteger)logs;
+ (BOOL)mas_updateConstraintsLogs:(NSInteger)logs;
+ (BOOL)mas_remakeConstraintsLogs:(NSInteger)logs;
+ (BOOL)mas_leftLogs:(NSInteger)logs;
+ (BOOL)mas_topLogs:(NSInteger)logs;
+ (BOOL)mas_rightLogs:(NSInteger)logs;
+ (BOOL)mas_bottomLogs:(NSInteger)logs;
+ (BOOL)mas_leadingLogs:(NSInteger)logs;
+ (BOOL)mas_trailingLogs:(NSInteger)logs;
+ (BOOL)mas_widthLogs:(NSInteger)logs;
+ (BOOL)mas_heightLogs:(NSInteger)logs;
+ (BOOL)mas_centerXLogs:(NSInteger)logs;
+ (BOOL)mas_centerYLogs:(NSInteger)logs;
+ (BOOL)mas_baselineLogs:(NSInteger)logs;
+ (BOOL)(NSLayoutAttribute))mas_attributeLogs:(NSInteger)logs;
+ (BOOL)mas_firstBaselineLogs:(NSInteger)logs;
+ (BOOL)mas_lastBaselineLogs:(NSInteger)logs;
+ (BOOL)mas_leftMarginLogs:(NSInteger)logs;
+ (BOOL)mas_rightMarginLogs:(NSInteger)logs;
+ (BOOL)mas_topMarginLogs:(NSInteger)logs;
+ (BOOL)mas_bottomMarginLogs:(NSInteger)logs;
+ (BOOL)mas_leadingMarginLogs:(NSInteger)logs;
+ (BOOL)mas_trailingMarginLogs:(NSInteger)logs;
+ (BOOL)mas_centerXWithinMarginsLogs:(NSInteger)logs;
+ (BOOL)mas_centerYWithinMarginsLogs:(NSInteger)logs;
+ (BOOL)mas_safeAreaLayoutGuideLogs:(NSInteger)logs;
+ (BOOL)mas_safeAreaLayoutGuideTopLogs:(NSInteger)logs;
+ (BOOL)mas_safeAreaLayoutGuideBottomLogs:(NSInteger)logs;
+ (BOOL)mas_safeAreaLayoutGuideLeftLogs:(NSInteger)logs;
+ (BOOL)mas_safeAreaLayoutGuideRightLogs:(NSInteger)logs;
+ (BOOL)mas_keyLogs:(NSInteger)logs;
+ (BOOL)setMas_keyLogs:(NSInteger)logs;
+ (BOOL)mas_closestCommonSuperviewLogs:(NSInteger)logs;

@end
