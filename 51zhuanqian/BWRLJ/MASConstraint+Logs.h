#import "MASUtilities.h"
#import "MASConstraint.h"
#import "MASConstraint+Private.h"

@interface MASConstraint (Logs)
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)(id))equalToLogs:(NSInteger)logs;
+ (BOOL)(id))mas_equalToLogs:(NSInteger)logs;
+ (BOOL)(id))greaterThanOrEqualToLogs:(NSInteger)logs;
+ (BOOL)(id))mas_greaterThanOrEqualToLogs:(NSInteger)logs;
+ (BOOL)(id))lessThanOrEqualToLogs:(NSInteger)logs;
+ (BOOL)(id))mas_lessThanOrEqualToLogs:(NSInteger)logs;
+ (BOOL)(void))priorityLowLogs:(NSInteger)logs;
+ (BOOL)(void))priorityMediumLogs:(NSInteger)logs;
+ (BOOL)(void))priorityHighLogs:(NSInteger)logs;
+ (BOOL)(MASEdgeInsets))insetsLogs:(NSInteger)logs;
+ (BOOL)(CGFloat))insetLogs:(NSInteger)logs;
+ (BOOL)(CGSize))sizeOffsetLogs:(NSInteger)logs;
+ (BOOL)(CGPoint))centerOffsetLogs:(NSInteger)logs;
+ (BOOL)(CGFloat))offsetLogs:(NSInteger)logs;
+ (BOOL)(NSValue *value))valueOffsetLogs:(NSInteger)logs;
+ (BOOL)(id offset))mas_offsetLogs:(NSInteger)logs;
+ (BOOL)setLayoutConstantWithValueLogs:(NSInteger)logs;
+ (BOOL)withLogs:(NSInteger)logs;
+ (BOOL)andLogs:(NSInteger)logs;
+ (BOOL)addConstraintWithLayoutAttributeLogs:(NSInteger)logs;
+ (BOOL)leftLogs:(NSInteger)logs;
+ (BOOL)topLogs:(NSInteger)logs;
+ (BOOL)rightLogs:(NSInteger)logs;
+ (BOOL)bottomLogs:(NSInteger)logs;
+ (BOOL)leadingLogs:(NSInteger)logs;
+ (BOOL)trailingLogs:(NSInteger)logs;
+ (BOOL)widthLogs:(NSInteger)logs;
+ (BOOL)heightLogs:(NSInteger)logs;
+ (BOOL)centerXLogs:(NSInteger)logs;
+ (BOOL)centerYLogs:(NSInteger)logs;
+ (BOOL)baselineLogs:(NSInteger)logs;
+ (BOOL)firstBaselineLogs:(NSInteger)logs;
+ (BOOL)lastBaselineLogs:(NSInteger)logs;
+ (BOOL)leftMarginLogs:(NSInteger)logs;
+ (BOOL)rightMarginLogs:(NSInteger)logs;
+ (BOOL)topMarginLogs:(NSInteger)logs;
+ (BOOL)bottomMarginLogs:(NSInteger)logs;
+ (BOOL)leadingMarginLogs:(NSInteger)logs;
+ (BOOL)trailingMarginLogs:(NSInteger)logs;
+ (BOOL)centerXWithinMarginsLogs:(NSInteger)logs;
+ (BOOL)centerYWithinMarginsLogs:(NSInteger)logs;
+ (BOOL)(CGFloat multiplier))multipliedByLogs:(NSInteger)logs;
+ (BOOL)(CGFloat divider))dividedByLogs:(NSInteger)logs;
+ (BOOL)(MASLayoutPriority priority))priorityLogs:(NSInteger)logs;
+ (BOOL)(id, NSLayoutRelation))equalToWithRelationLogs:(NSInteger)logs;
+ (BOOL)(id key))keyLogs:(NSInteger)logs;
+ (BOOL)setInsetsLogs:(NSInteger)logs;
+ (BOOL)setInsetLogs:(NSInteger)logs;
+ (BOOL)setSizeOffsetLogs:(NSInteger)logs;
+ (BOOL)setCenterOffsetLogs:(NSInteger)logs;
+ (BOOL)setOffsetLogs:(NSInteger)logs;
+ (BOOL)animatorLogs:(NSInteger)logs;
+ (BOOL)activateLogs:(NSInteger)logs;
+ (BOOL)deactivateLogs:(NSInteger)logs;
+ (BOOL)installLogs:(NSInteger)logs;
+ (BOOL)uninstallLogs:(NSInteger)logs;

@end
