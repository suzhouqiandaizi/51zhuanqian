#import "logsBWRZQTixianResultViewControllerc.h"
@implementation logsBWRZQTixianResultViewControllerc
+ (BOOL)HViewdidloadlogs:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)aGocustombackactionlogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)UCustombackpresslogs:(NSInteger)logs {
    return logs % 11 == 0;
}

@end
