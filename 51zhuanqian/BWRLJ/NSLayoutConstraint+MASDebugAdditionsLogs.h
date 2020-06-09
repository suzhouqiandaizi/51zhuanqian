#import "MASUtilities.h"
#import "NSLayoutConstraint+MASDebugAdditions.h"
#import "MASConstraint.h"
#import "MASLayoutConstraint.h"

@interface NSLayoutConstraint (MASDebugAdditionsLogs)
+ (BOOL)layoutRelationDescriptionsByValueLogs:(NSInteger)logs;
+ (BOOL)layoutAttributeDescriptionsByValueLogs:(NSInteger)logs;
+ (BOOL)layoutPriorityDescriptionsByValueLogs:(NSInteger)logs;
+ (BOOL)descriptionForObjectLogs:(NSInteger)logs;
+ (BOOL)descriptionLogs:(NSInteger)logs;

@end
