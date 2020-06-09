#import "UIView+DZNConstraintBasedLayoutExtensionsLogsLogs.h"
@implementation UIView (DZNConstraintBasedLayoutExtensionsLogsLogs)
+ (BOOL)equallyRelatedConstraintWithViewAttributeLogsLogs:(NSInteger)logs {
    return logs % 49 == 0;
}

@end
