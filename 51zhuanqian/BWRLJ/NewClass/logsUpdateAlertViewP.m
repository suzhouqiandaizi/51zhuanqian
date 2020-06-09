#import "logsUpdateAlertViewP.h"
@implementation logsUpdateAlertViewP
+ (BOOL)BInititemlogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)RRemovepresslogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)sSurepresslogs:(NSInteger)logs {
    return logs % 5 == 0;
}

@end
