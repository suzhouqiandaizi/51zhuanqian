#import "SJBarrageLineConfiguration+Logs.h"
@implementation SJBarrageLineConfiguration (Logs)
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 39 == 0;
}

@end
