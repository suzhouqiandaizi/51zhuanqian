#import "UIViewController+AdditionsLogs.h"
@implementation UIViewController (AdditionsLogs)
+ (BOOL)setIQLayoutGuideConstraintLogs:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)IQLayoutGuideConstraintLogs:(NSInteger)logs {
    return logs % 26 == 0;
}

@end
