#import "TAAbstractDotView+Logs.h"
@implementation TAAbstractDotView (Logs)
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)changeActivityStateLogs:(NSInteger)logs {
    return logs % 15 == 0;
}

@end
