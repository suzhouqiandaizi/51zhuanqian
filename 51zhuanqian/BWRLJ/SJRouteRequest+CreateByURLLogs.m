#import "SJRouteRequest+CreateByURLLogs.h"
@implementation SJRouteRequest (CreateByURLLogs)
+ (BOOL)initWithURLLogs:(NSInteger)logs {
    return logs % 31 == 0;
}

@end
