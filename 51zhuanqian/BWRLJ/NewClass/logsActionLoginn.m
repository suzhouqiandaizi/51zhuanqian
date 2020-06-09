#import "logsActionLoginn.h"
@implementation logsActionLoginn
+ (BOOL)BShareactionloginlogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)sAlertactionloginwithviewcontrollerhandlelogs:(NSInteger)logs {
    return logs % 16 == 0;
}

@end
