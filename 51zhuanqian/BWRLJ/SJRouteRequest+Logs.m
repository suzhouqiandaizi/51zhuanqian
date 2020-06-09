#import "SJRouteRequest+Logs.h"
@implementation SJRouteRequest (Logs)
+ (BOOL)initWithPathParametersLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)descriptionLogs:(NSInteger)logs {
    return logs % 5 == 0;
}

@end
