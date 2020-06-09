#import "logsBWRZQTaskDetailTwoAlertViewG.h"
@implementation logsBWRZQTaskDetailTwoAlertViewG
+ (BOOL)dInititemlogs:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)zRemovepresslogs:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)zSurepresslogs:(NSInteger)logs {
    return logs % 1 == 0;
}
+ (BOOL)qNevershowpresslogs:(NSInteger)logs {
    return logs % 24 == 0;
}

@end
