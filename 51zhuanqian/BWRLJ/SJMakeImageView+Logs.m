#import "SJMakeImageView+Logs.h"
@implementation SJMakeImageView (Logs)
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 44 == 0;
}
+ (BOOL)resultLogs:(NSInteger)logs {
    return logs % 50 == 0;
}

@end
