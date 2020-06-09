#import "logsBWRZQTaskButtone.h"
@implementation logsBWRZQTaskButtone
+ (BOOL)bDrawrect:(NSInteger)logs {
    return logs % 34 == 0;
}
+ (BOOL)DSettaskbutton:(NSInteger)logs {
    return logs % 9 == 0;
}
+ (BOOL)PSettaskbuttontitleAWithstatus:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)uSettaskdoingbuttontitleQWithstatus:(NSInteger)logs {
    return logs % 6 == 0;
}

@end
