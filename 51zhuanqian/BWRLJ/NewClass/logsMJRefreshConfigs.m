#import "logsMJRefreshConfigs.h"
@implementation logsMJRefreshConfigs
+ (BOOL)xdefaultConfig:(NSInteger)logs {
    return logs % 14 == 0;
}

@end
