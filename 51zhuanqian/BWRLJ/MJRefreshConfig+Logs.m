#import "MJRefreshConfig+Logs.h"
@implementation MJRefreshConfig (Logs)
+ (BOOL)defaultConfigLogs:(NSInteger)logs {
    return logs % 11 == 0;
}

@end
