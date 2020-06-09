#import "UIView+DZNConstraintBasedLayoutExtensionsLogs.h"
@implementation UIView (DZNConstraintBasedLayoutExtensionsLogs)
+ (BOOL)equallyRelatedConstraintWithViewAttributeLogs:(NSInteger)logs {
    return logs % 27 == 0;
}

@end
