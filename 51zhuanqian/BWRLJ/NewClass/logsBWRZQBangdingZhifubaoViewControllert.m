#import "logsBWRZQBangdingZhifubaoViewControllert.h"
@implementation logsBWRZQBangdingZhifubaoViewControllert
+ (BOOL)NViewdidloadlogs:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)nSurepresslogs:(NSInteger)logs {
    return logs % 34 == 0;
}

@end
