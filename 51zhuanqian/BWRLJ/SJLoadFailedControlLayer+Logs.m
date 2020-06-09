#import "SJLoadFailedControlLayer+Logs.h"
@implementation SJLoadFailedControlLayer (Logs)
+ (BOOL)initWithFrameLogs:(NSInteger)logs {
    return logs % 10 == 0;
}

@end
