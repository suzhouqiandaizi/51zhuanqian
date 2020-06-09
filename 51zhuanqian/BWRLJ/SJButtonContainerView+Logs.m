#import "SJButtonContainerView+Logs.h"
@implementation SJButtonContainerView (Logs)
+ (BOOL)initWithEdgeInsetsLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)layoutSubviewsLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)setInsetsLogs:(NSInteger)logs {
    return logs % 50 == 0;
}

@end
