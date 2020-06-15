#import "logsWYZQTaskButtonL.h"
@implementation logsWYZQTaskButtonL
+ (BOOL)WDrawrect:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)XSettaskbutton:(NSInteger)logs {
    return logs % 44 == 0;
}
+ (BOOL)FSettaskbuttontitlewWithstatus:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)ISettaskdoingbuttontitleOWithstatus:(NSInteger)logs {
    return logs % 31 == 0;
}

@end
