#import "logsUpdateAlertViewL.h"
@implementation logsUpdateAlertViewL
+ (BOOL)rInititem:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)DremovePress:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)usurePress:(NSInteger)logs {
    return logs % 38 == 0;
}

@end
