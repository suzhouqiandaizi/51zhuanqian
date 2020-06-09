#import "MASConstraint.h"
#import "MASUtilities.h"
#import "MASCompositeConstraint.h"
#import "MASConstraint+Private.h"

@interface MASCompositeConstraint (Logs)
+ (BOOL)initWithChildrenLogs:(NSInteger)logs;
+ (BOOL)constraintShouldbereplacedwithconstraintLogs:(NSInteger)logs;
+ (BOOL)constraintAddconstraintwithlayoutattributeLogs:(NSInteger)logs;
+ (BOOL)(CGFloat))multipliedByLogs:(NSInteger)logs;
+ (BOOL)(CGFloat))dividedByLogs:(NSInteger)logs;
+ (BOOL)(MASLayoutPriority))priorityLogs:(NSInteger)logs;
+ (BOOL)(id, NSLayoutRelation))equalToWithRelationLogs:(NSInteger)logs;
+ (BOOL)addConstraintWithLayoutAttributeLogs:(NSInteger)logs;
+ (BOOL)animatorLogs:(NSInteger)logs;
+ (BOOL)(id))keyLogs:(NSInteger)logs;
+ (BOOL)setInsetsLogs:(NSInteger)logs;
+ (BOOL)setInsetLogs:(NSInteger)logs;
+ (BOOL)setOffsetLogs:(NSInteger)logs;
+ (BOOL)setSizeOffsetLogs:(NSInteger)logs;
+ (BOOL)setCenterOffsetLogs:(NSInteger)logs;
+ (BOOL)activateLogs:(NSInteger)logs;
+ (BOOL)deactivateLogs:(NSInteger)logs;
+ (BOOL)installLogs:(NSInteger)logs;
+ (BOOL)uninstallLogs:(NSInteger)logs;

@end
