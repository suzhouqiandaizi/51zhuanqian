#import "logsRefreshErrorAlertViewc.h"
@implementation logsRefreshErrorAlertViewc
+ (BOOL)dInititemwithtypewithtiplogs:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)TInititemwithtypewithtiprefreshlogs:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)DRefreshpresslogs:(NSInteger)logs {
    return logs % 6 == 0;
}

@end
