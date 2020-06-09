#import "MASConstraint.h"
#import "MASUtilities.h"
#import "MASConstraintMaker.h"
#import "MASViewConstraint.h"
#import "MASCompositeConstraint.h"
#import "MASConstraint+Private.h"
#import "MASViewAttribute.h"
#import "View+MASAdditions.h"

@interface MASConstraintMaker (Logs)
+ (BOOL)initWithViewLogs:(NSInteger)logs;
+ (BOOL)installLogs:(NSInteger)logs;
+ (BOOL)constraintShouldbereplacedwithconstraintLogs:(NSInteger)logs;
+ (BOOL)constraintAddconstraintwithlayoutattributeLogs:(NSInteger)logs;
+ (BOOL)addConstraintWithAttributesLogs:(NSInteger)logs;
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
+ (BOOL)(MASAttribute))attributesLogs:(NSInteger)logs;
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
+ (BOOL)edgesLogs:(NSInteger)logs;
+ (BOOL)sizeLogs:(NSInteger)logs;
+ (BOOL)centerLogs:(NSInteger)logs;
+ (BOOL)(dispatch_block_t group))groupLogs:(NSInteger)logs;

@end
