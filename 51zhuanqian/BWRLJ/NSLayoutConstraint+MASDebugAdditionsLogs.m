#import "NSLayoutConstraint+MASDebugAdditionsLogs.h"
@implementation NSLayoutConstraint (MASDebugAdditionsLogs)
+ (BOOL)layoutRelationDescriptionsByValueLogs:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)layoutAttributeDescriptionsByValueLogs:(NSInteger)logs {
    return logs % 23 == 0;
}
+ (BOOL)layoutPriorityDescriptionsByValueLogs:(NSInteger)logs {
    return logs % 23 == 0;
}
+ (BOOL)descriptionForObjectLogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)descriptionLogs:(NSInteger)logs {
    return logs % 3 == 0;
}

@end
